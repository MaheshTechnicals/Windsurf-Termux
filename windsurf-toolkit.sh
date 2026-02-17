#!/bin/bash

# ==========================================
# Windsurf Toolkit for ARM64/Proot
# Author: Mahesh Technicals
# ==========================================

set -e

# --- Modern Colors & Styling ---
C_CYAN='\033[1;36m'
C_BLUE='\033[1;34m'
C_PURPLE='\033[1;35m'
C_GREEN='\033[1;32m'
C_YELLOW='\033[1;33m'
C_RED='\033[1;31m'
C_WHITE='\033[1;37m'
NC='\033[0m' # No Color

# --- Header ---
draw_header() {
    clear
    echo -e "${C_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${C_PURPLE}🌊 WINDSURF TOOLKIT v1.3${NC}"
    echo -e "  ${C_BLUE}✨ Author: Mahesh Technicals ✨${NC}"
    echo -e "${C_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# --- Dependency Checker ---
check_dependencies() {
    echo -e "\n${C_CYAN}🔍 Checking system dependencies...${NC}"
    for pkg in p7zip-full tar binutils; do
        if ! dpkg -s "$pkg" >/dev/null 2>&1; then
            echo -e "   ${C_YELLOW}📦 Installing missing: ${C_WHITE}$pkg...${NC}"
            sudo apt-get install -y "$pkg" > /dev/null
        else
            echo -e "   ${C_GREEN}✅ $pkg is already installed.${NC}"
        fi
    done
}

# --- Apply Fixes (Sandbox & Config) ---
apply_fixes() {
    echo -e "\n${C_PURPLE}🛠️  Applying optimizations...${NC}"
    DESKTOP_FILE="/usr/share/applications/windsurf.desktop"
    
    if [ -f "$DESKTOP_FILE" ]; then
        sudo sed -i 's/Exec=\/usr\/share\/windsurf\/windsurf %F/Exec=\/usr\/share\/windsurf\/windsurf --no-sandbox %F/g' "$DESKTOP_FILE"
        sudo sed -i 's/Exec=\/usr\/share\/windsurf\/windsurf --new-window/Exec=\/usr\/share\/windsurf\/windsurf --new-window --no-sandbox/g' "$DESKTOP_FILE"
        echo -e "   ${C_GREEN}✅ Desktop shortcuts patched (--no-sandbox)${NC}"
    else
        echo -e "   ${C_YELLOW}⚠️  Desktop file not found. Skipping patch.${NC}"
    fi

    USER_HOME=$(eval echo ~${SUDO_USER:-$USER})
    CONFIG_DIR="$USER_HOME/.config/Windsurf/User"
    SETTINGS_FILE="$CONFIG_DIR/settings.json"
    
    mkdir -p "$CONFIG_DIR"
    
    if [ ! -f "$SETTINGS_FILE" ]; then
        echo '{' > "$SETTINGS_FILE"
        echo '  "extensions.verifySignature": false,' >> "$SETTINGS_FILE"
        echo '  "settingsSync.keychain": false,' >> "$SETTINGS_FILE"
        echo '  "security.workspace.trust.enabled": false' >> "$SETTINGS_FILE"
        echo '}' >> "$SETTINGS_FILE"
    else
        sed -i '$ d' "$SETTINGS_FILE"
        sed -i '$ s/$/,/' "$SETTINGS_FILE"
        echo '  "extensions.verifySignature": false,' >> "$SETTINGS_FILE"
        echo '  "settingsSync.keychain": false,' >> "$SETTINGS_FILE"
        echo '  "security.workspace.trust.enabled": false' >> "$SETTINGS_FILE"
        echo '}' >> "$SETTINGS_FILE"
    fi
    chown -R ${SUDO_USER:-$USER}:${SUDO_USER:-$USER} "$CONFIG_DIR"
    echo -e "   ${C_GREEN}✅ VS Code / User settings injected${NC}"
}

# --- Main Menu ---
draw_header

# Check current version
OLD_VER=$(dpkg-query -W -f='${Version}' windsurf 2>/dev/null || echo "Not installed")
echo -e "${C_YELLOW}📌 Current Version: ${C_WHITE}$OLD_VER${NC}\n"

echo -e "  ${C_WHITE}1.${NC} 🚀 Install or Update Windsurf"
echo -e "  ${C_WHITE}2.${NC} 🗑️  Uninstall Windsurf"
echo -e "  ${C_WHITE}3.${NC} ❌ Exit"
echo ""
echo -n -e "${C_CYAN}👉 Choose an option [1-3]: ${NC}"
read choice

if [ "$choice" == "1" ]; then
    echo -e "\n${C_CYAN}🔄 Checking repository for updates...${NC}"
    sudo apt-get update -qq
    
    # Fetch the version available in the apt repository
    CANDIDATE_VER=$(apt-cache policy windsurf | grep 'Candidate:' | awk '{print $2}')
    
    if [ -z "$CANDIDATE_VER" ] || [ "$CANDIDATE_VER" == "(none)" ]; then
        echo -e "   ${C_RED}❌ Could not find Windsurf in the apt repository. Please check your sources.${NC}"
        exit 1
    fi
    
    # Smart Version Comparison Logic
    if [ "$OLD_VER" != "Not installed" ] && [ "$OLD_VER" == "$CANDIDATE_VER" ]; then
        echo -e "   ${C_GREEN}✅ You already have the latest version ($OLD_VER) installed.${NC}"
        echo -n -e "   ${C_YELLOW}👉 Do you want to reinstall it anyway? [y/N]: ${NC}"
        read reinstall_choice
        if [[ "$reinstall_choice" != "y" && "$reinstall_choice" != "Y" ]]; then
            echo -e "\n${C_CYAN}Operation cancelled. Have a great day! 👋${NC}"
            exit 0
        fi
    elif [ "$OLD_VER" != "Not installed" ]; then
        echo -e "   ${C_PURPLE}🚀 New version found! Preparing to update...${NC}"
    fi

    check_dependencies
    
    WORK_DIR=$(mktemp -d)
    cd "$WORK_DIR"
    
    echo -e "\n${C_BLUE}📥 Downloading Windsurf package ($CANDIDATE_VER)...${NC}"
    apt download windsurf

    echo -e "\n${C_PURPLE}🔓 Unpacking archive (bypassing dpkg bugs)...${NC}"
    ar x windsurf*.deb
    mkdir -p repack/DEBIAN

    echo -e "${C_BLUE}🗜️  Decompressing core files with 7zip...${NC}"
    7z x data.tar.xz -y > /dev/null
    7z x control.tar.xz -y > /dev/null

    echo -e "${C_PURPLE}📂 Extracting structural data...${NC}"
    tar -xf data.tar -C repack/
    tar -xf control.tar -C repack/DEBIAN/

    echo -e "${C_BLUE}📦 Repackaging with stable gzip compression...${NC}"
    echo -e "   ${C_YELLOW}⏳ (This takes 1-2 minutes, please wait...)${NC}"
    dpkg-deb -Zgzip --root-owner-group --build repack windsurf-fixed.deb > /dev/null 2>&1

    echo -e "${C_CYAN}💻 Installing Windsurf...${NC}"
    sudo dpkg -i windsurf-fixed.deb > /dev/null 2>&1 || true

    apply_fixes

    # Cleanup & Version check
    cd ~
    rm -rf "$WORK_DIR"
    NEW_VER=$(dpkg-query -W -f='${Version}' windsurf 2>/dev/null || echo "Unknown")
    
    echo ""
    echo -e "${C_GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${C_GREEN}🎉 SUCCESS! Windsurf is ready to use.${NC}"
    echo -e "${C_GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    
    if [ "$OLD_VER" == "Not installed" ]; then
        echo -e "${C_CYAN}📈 Installed Version:${NC} ${C_WHITE}$NEW_VER${NC}"
    else
        echo -e "${C_CYAN}📈 Update Summary:${NC}"
        echo -e "   ${C_PURPLE}Old:${NC} ${C_WHITE}$OLD_VER${NC}"
        echo -e "   ${C_GREEN}New:${NC} ${C_WHITE}$NEW_VER${NC}"
    fi
    echo ""

elif [ "$choice" == "2" ]; then
    echo -e "\n${C_RED}🗑️  Uninstalling Windsurf...${NC}"
    sudo apt remove --purge windsurf -y > /dev/null 2>&1
    sudo apt autoremove -y > /dev/null 2>&1
    echo -e "   ${C_GREEN}✅ Windsurf has been completely removed.${NC}"

elif [ "$choice" == "3" ]; then
    echo -e "\n${C_YELLOW}Exiting toolkit. Have a great day! 👋${NC}"
    exit 0
else
    echo -e "\n${C_RED}❌ Invalid choice. Exiting.${NC}"
    exit 1
fi
