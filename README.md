# 🌊 Windsurf IDE Installer for Termux & Linux ARM64 | Complete Setup Toolkit

<div align="center">

> **Install Windsurf Code Editor on Android Termux, ARM64 Linux, and Proot Environments**  
> **Automated Installation Script | Fix dpkg Errors | One-Click Setup**

[![Termux](https://img.shields.io/badge/Platform-Termux%20%7C%20Linux%20ARM64-blue?style=for-the-badge&logo=linux)](https://termux.com/)
[![Bash](https://img.shields.io/badge/Written%20in-Bash-success?style=for-the-badge&logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-orange?style=for-the-badge)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/MaheshTechnicals/Windsurf-Termux?style=for-the-badge)](https://github.com/MaheshTechnicals/Windsurf-Termux/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/MaheshTechnicals/Windsurf-Termux?style=for-the-badge)](https://github.com/MaheshTechnicals/Windsurf-Termux/network)

**Author:** [Mahesh Technicals](https://github.com/MaheshTechnicals) | **Version:** v1.3 | **Last Updated:** February 2026

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Key Features](#-key-features)
- [Prerequisites](#-prerequisites)
- [Quick Installation](#-quick-installation)
- [Detailed Usage Guide](#-detailed-usage-guide)
- [Common Issues & Solutions](#-common-issues--solutions)
- [Technical Details](#-technical-details)
- [FAQ](#-frequently-asked-questions-faq)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [Support & Donations](#-support-the-project)
- [License](#-license)

---

## 🌟 Overview

**Windsurf Toolkit for ARM64** is a powerful, automated bash script that enables seamless installation of the **Windsurf Code Editor** (AI-powered IDE by Codeium) on ARM64 devices including **Android Termux**, **Linux ARM64**, and **Proot environments**. 

This toolkit solves the notorious `dpkg` memory corruption bug (`double free or corruption`) that prevents standard installation on ARM-based systems by intelligently repackaging Debian packages with compatible compression formats.

### 🎯 Why Use This Toolkit?

- **Fixes ARM64 Installation Errors**: Resolves dpkg decompression failures on ARM devices
- **Automated Process**: One-command installation with zero manual intervention
- **Smart Version Management**: Auto-detects updates and prevents unnecessary reinstalls
- **Performance Optimized**: Pre-configures Windsurf settings for optimal ARM64 performance
- **Sandbox Fix Included**: Automatically patches Electron security issues for containerized environments

### 🖥️ Supported Platforms

- ✅ **Android Termux** (ARM64/AARCH64)
- ✅ **Linux ARM64** (Ubuntu, Debian, Raspberry Pi OS)
- ✅ **Proot-Distro Environments** (Termux-based)
- ✅ **Chroot Systems** (ARM64 Linux distributions)
- ✅ **WSL2 ARM** (Windows Subsystem for Linux on ARM)

---

## ✨ Key Features

### 🚀 **Smart Installation System**
- Automatically detects existing Windsurf installations
- Compares current version with repository version
- Prevents redundant installations and saves bandwidth
- Intelligent reinstallation prompts when already up-to-date

### 📦 **Advanced Bug Bypass Mechanism**
- Uses `7zip` + `tar` combination to safely unpack `.deb` packages
- Recompresses with `gzip` instead of problematic `zstd` format
- Completely eliminates ARM64 installation crashes
- Handles dpkg memory errors automatically

### 🔄 **Automatic Update Management**
- Fetches latest version from official repositories
- Compares versions before downloading
- Smart update prompts to save time and bandwidth
- Seamless upgrade path from older versions

### 🛠️ **Auto-Patcher & Optimizer**
- **Sandbox Fix**: Patches desktop shortcuts with `--no-sandbox` flags for Electron apps
- **Config Injection**: Auto-configures `settings.json` for ARM64 optimization
- **Performance Tuning**: Disables unnecessary security features causing slowdowns
- **Desktop Integration**: Ensures proper application launcher functionality

### 🎨 **Modern Terminal UI**
- Beautiful gradient-colored interface
- Real-time progress indicators
- Descriptive status messages with emojis
- Clean, professional output formatting

### 🔍 **Dependency Management**
- Auto-checks and installs required system packages
- Verifies `p7zip-full`, `tar`, and `binutils` availability
- Silent installation of missing dependencies
- No manual intervention required

---

## 📋 Prerequisites

Before running the Windsurf Toolkit, ensure you have:

### Required Software
- **Operating System**: Linux ARM64 / Android Termux
- **Shell**: Bash 4.0+
- **Package Manager**: apt/apt-get (Debian-based distributions)
- **Network**: Active internet connection for downloads
- **Storage**: At least 500MB free space

### For Termux Users
```bash
# Update packages first
pkg update && pkg upgrade -y

# Install essential tools
pkg install wget curl tar -y
```

### For Linux ARM64 Users
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install wget if not present
sudo apt install wget -y
```

### Permissions
- **Root/Sudo Access**: Required for package installation
- **Write Permissions**: Needed for `/usr/share/` and `/usr/local/` directories

---

## 📥 Quick Installation

### One-Line Installation Command

```bash
wget -qO- https://raw.githubusercontent.com/MaheshTechnicals/Windsurf-Termux/main/windsurf-toolkit.sh | bash
```

### Manual Installation (Recommended)

```bash
# Step 1: Download the script
wget https://raw.githubusercontent.com/MaheshTechnicals/Windsurf-Termux/main/windsurf-toolkit.sh

# Step 2: Make it executable
chmod +x windsurf-toolkit.sh

# Step 3: Run the toolkit
./windsurf-toolkit.sh
```

### Alternative Methods

#### Using cURL
```bash
curl -O https://raw.githubusercontent.com/MaheshTechnicals/Windsurf-Termux/main/windsurf-toolkit.sh
chmod +x windsurf-toolkit.sh
./windsurf-toolkit.sh
```

#### Clone Repository
```bash
git clone https://github.com/MaheshTechnicals/Windsurf-Termux.git
cd Windsurf-Termux
chmod +x windsurf-toolkit.sh
./windsurf-toolkit.sh
```

> **💡 Tip:** If `wget` is not installed, run `pkg install wget` (Termux) or `sudo apt install wget` (Linux)

---

## 📖 Detailed Usage Guide

Once executed, the toolkit presents an interactive menu:

### Main Menu Options

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🌊 WINDSURF TOOLKIT v1.3
  ✨ Author: Mahesh Technicals ✨
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📌 Current Version: [Displays installed version or "Not installed"]

  1. 🚀 Install or Update Windsurf
  2. 🗑️  Uninstall Windsurf
  3. ❌ Exit

👉 Choose an option [1-3]:
```

---

### Option 1️⃣: Install or Update Windsurf

This is the primary function that performs:

#### Step-by-Step Process:

1. **Version Check**
   - Queries currently installed Windsurf version
   - Fetches latest available version from repositories
   - Compares versions and displays update availability

2. **Smart Installation Logic**
   - If **not installed**: Proceeds with fresh installation
   - If **outdated**: Automatically updates to latest version
   - If **up-to-date**: Asks user confirmation before reinstalling

3. **Dependency Installation**
   - Checks for `p7zip-full`, `tar`, `binutils`
   - Automatically installs missing packages
   - Verifies successful installation

4. **Package Download**
   - Downloads official `.deb` package from repository
   - Displays download progress
   - Validates package integrity

5. **Advanced Repackaging**
   - Extracts `.deb` using `ar` archive tool
   - Decompresses `data.tar.xz` and `control.tar.xz` with 7zip
   - Extracts structural data with tar
   - Repackages using stable `gzip` compression
   - Creates ARM64-compatible Debian package

6. **Installation**
   - Installs repackaged `.deb` via dpkg
   - Handles installation errors gracefully
   - Applies automatic fixes post-installation

7. **Patching & Optimization**
   - **Desktop Shortcut Fix**: Adds `--no-sandbox` to `.desktop` files
   - **Settings Injection**: Creates/updates `~/.config/Windsurf/User/settings.json`
   - **Performance Config**: Optimizes extensions and security settings

8. **Cleanup & Verification**
   - Removes temporary files
   - Verifies installation success
   - Displays version summary

#### Example Output:
```
🔄 Checking repository for updates...
✅ You already have the latest version (1.3.0) installed.
👉 Do you want to reinstall it anyway? [y/N]: n

Operation cancelled. Have a great day! 👋
```

---

### Option 2️⃣: Uninstall Windsurf

Completely removes Windsurf from your system:

- Purges Windsurf package using apt
- Removes all configuration files
- Cleans up unused dependencies
- Frees up disk space

#### Command Executed:
```bash
sudo apt remove --purge windsurf -y
sudo apt autoremove -y
```

---

### Option 3️⃣: Exit

Safely exits the toolkit without changes.

---

## 🔧 Common Issues & Solutions

### Issue 1: dpkg Crash on ARM64

**Error Message:**
```
double free or corruption (out)
dpkg-deb: error: <decompress> subprocess was killed by signal (Aborted)
```

**Root Cause:**  
ARM64 dpkg struggles with `zstd` compressed Debian packages due to memory management issues in decompression libraries.

**Solution Implemented:**  
The toolkit extracts the `.deb` using `7zip` and recompresses using `gzip` compression, which is fully compatible with ARM64 dpkg.

**Manual Fix (if not using toolkit):**
```bash
ar x windsurf.deb
7z x data.tar.xz
7z x control.tar.xz
mkdir -p repack/DEBIAN
tar -xf data.tar -C repack/
tar -xf control.tar -C repack/DEBIAN/
dpkg-deb -Zgzip --build repack windsurf-fixed.deb
sudo dpkg -i windsurf-fixed.deb
```

---

### Issue 2: Sandbox Errors (Electron Apps)

**Error Message:**
```
[FATAL:setuid_sandbox_host.cc] The SUID sandbox helper binary was found, but is not configured correctly.
```

**Root Cause:**  
Electron-based applications (including Windsurf) require elevated permissions to create sandboxed processes. In Termux/Proot environments, these permissions are unavailable.

**Solution Implemented:**  
The toolkit automatically patches `.desktop` files to include `--no-sandbox` flag, bypassing the sandboxing requirement.

**Manual Fix:**
```bash
# Edit desktop file
sudo nano /usr/share/applications/windsurf.desktop

# Change all Exec lines to include --no-sandbox:
Exec=/usr/share/windsurf/windsurf --no-sandbox %F
Exec=/usr/share/windsurf/windsurf --new-window --no-sandbox
```

---

### Issue 3: VS Code Settings Errors

**Problem:**  
Extension signature verification and keychain access fail on ARM64/Termux.

**Solution Implemented:**  
Auto-injects optimized settings into `~/.config/Windsurf/User/settings.json`:

```json
{
  "extensions.verifySignature": false,
  "settingsSync.keychain": false,
  "security.workspace.trust.enabled": false
}
```

These settings disable problematic features while maintaining functionality.

---

## 🔍 Technical Details

### How the Repackaging Process Works

#### Architecture of Debian Packages

A `.deb` file is an `ar` archive containing:
- `debian-binary`: Package format version
- `control.tar.xz`: Package metadata (name, version, dependencies)
- `data.tar.xz`: Actual program files

#### Problem with Standard dpkg
Standard dpkg on ARM64 uses internal decompression for `xz` archives compressed with `zstd`, which triggers memory corruption bugs.

#### Toolkit's Solution

```bash
# Extract archive components
ar x windsurf.deb

# Decompress using external 7zip (more stable)
7z x data.tar.xz -y
7z x control.tar.xz -y

# Create new package structure
mkdir -p repack/DEBIAN
tar -xf data.tar -C repack/
tar -xf control.tar -C repack/DEBIAN/

# Repackage with gzip (ARM64-safe compression)
dpkg-deb -Zgzip --root-owner-group --build repack windsurf-fixed.deb
```

This approach:
1. Avoids dpkg's internal decompressor
2. Uses external tools with better ARM64 support
3. Recompresses with universally compatible format
4. Maintains package integrity and metadata

---

### Applied Patches Explained

#### 1. Desktop Entry Patch
**File Modified:** `/usr/share/applications/windsurf.desktop`

**Changes:**
```diff
-Exec=/usr/share/windsurf/windsurf %F
+Exec=/usr/share/windsurf/windsurf --no-sandbox %F

-Exec=/usr/share/windsurf/windsurf --new-window
+Exec=/usr/share/windsurf/windsurf --new-window --no-sandbox
```

#### 2. User Settings Injection
**File Created/Modified:** `~/.config/Windsurf/User/settings.json`

**Purpose:**
- Disable extension signature checks (fails on ARM64)
- Disable keychain integration (unavailable in Termux)
- Disable workspace trust dialogs (interferes with workflow)

---

## ❓ Frequently Asked Questions (FAQ)

### Q1: Is this tool safe to use?
**A:** Yes! The toolkit only performs standard package management operations and uses official Windsurf packages. It's open-source and auditable.

### Q2: Will this work on Raspberry Pi?
**A:** Absolutely! Raspberry Pi (3/4/5) runs ARM64 architecture and is fully supported.

### Q3: Does this modify the Windsurf source code?
**A:** No. It only repackages the official binary and applies configuration fixes. The application itself remains unchanged.

### Q4: Can I update Windsurf later?
**A:** Yes! Just run the toolkit again. It automatically detects and installs updates.

### Q5: Will this interfere with official Windsurf updates?
**A:** No. The repackaging process maintains package management compatibility. You can use `apt update && apt upgrade` normally.

### Q6: Why not just fix the dpkg bug?
**A:** The dpkg bug is in upstream dependencies (libzstd, liblzma) and requires kernel-level fixes. This toolkit provides an immediate workaround.

### Q7: Can I use this on x86/x64 systems?
**A:** This toolkit is specifically for ARM64. x86/x64 users should use the official installer from Codeium.

### Q8: Do I need root access?
**A:** Yes, package installation requires root/sudo privileges. However, Windsurf itself can run as a regular user after installation.

---

## 🔧 Troubleshooting

### Problem: "wget: command not found"
**Solution:**
```bash
# Termux
pkg install wget

# Linux
sudo apt install wget
```

---

### Problem: "Permission denied" error
**Solution:**
```bash
# Make script executable
chmod +x windsurf-toolkit.sh

# Run with sudo if needed
sudo ./windsurf-toolkit.sh
```

---

### Problem: Script hangs during repackaging
**Solution:**
- This is normal for large packages
- Wait 2-3 minutes for gzip compression to complete
- Check available disk space (`df -h`)

---

### Problem: Windsurf won't launch after installation
**Solution:**
```bash
# Try launching with debug output
/usr/share/windsurf/windsurf --no-sandbox --verbose

# Check logs
cat ~/.config/Windsurf/logs/main.log
```

---

### Problem: "Could not find Windsurf in apt repository"
**Solution:**
Add Codeium repository manually:
```bash
wget -qO - https://codeium.com/windsurf/linux/deb/public.key | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/windsurf-archive-keyring.gpg arch=arm64] https://codeium.com/windsurf/linux/deb stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list
sudo apt update
```

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### Ways to Contribute
- 🐛 **Report Bugs**: Open an issue with details
- 💡 **Suggest Features**: Share your ideas
- 📝 **Improve Documentation**: Fix typos, add examples
- 🔧 **Submit Code**: Create pull requests

### Development Setup
```bash
git clone https://github.com/MaheshTechnicals/Windsurf-Termux.git
cd Windsurf-Termux
./windsurf-toolkit.sh
```

### Contribution Guidelines
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 💝 Support The Project

If you find this tool helpful and want to support continued development, please consider buying me a coffee!

<div align="center">

<a href="https://www.paypal.com/paypalme/Varma161" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

**UPI:** `maheshtechnicals@apl`

</div>

Your support helps maintain and improve this project! ❤️

---

## 👨‍💻 Credits & Acknowledgments

- **Script Developer**: [Mahesh Technicals](https://github.com/MaheshTechnicals)
- **Toolkit Version**: 1.3
- **Windsurf IDE**: Developed by [Codeium](https://codeium.com/)
- **Community Contributors**: Thank you to all who reported issues and suggested improvements!

---

## ⚠️ Disclaimer

This tool is provided for educational and convenience purposes to help run Windsurf on non-standard ARM64 environments (Android Termux, Linux ARM, Proot).

**Important Notes:**
- This toolkit is **not officially affiliated** with Codeium or Windsurf
- Use at your own risk
- Always backup important data before installation
- The repackaging process maintains official binaries without modification
- Windsurf® is a trademark of Codeium Inc.

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Mahesh Technicals

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software.
```

---

## 📞 Contact & Support

- **GitHub**: [@MaheshTechnicals](https://github.com/MaheshTechnicals)
- **Issues**: [Report a Bug](https://github.com/MaheshTechnicals/Windsurf-Termux/issues)
- **Discussions**: [Join Community](https://github.com/MaheshTechnicals/Windsurf-Termux/discussions)

---

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=MaheshTechnicals/Windsurf-Termux&type=Date)](https://star-history.com/#MaheshTechnicals/Windsurf-Termux&Date)

---

## 📊 Keywords

`windsurf termux`, `windsurf android`, `windsurf arm64`, `windsurf linux`, `install windsurf termux`, `windsurf ide`, `codeium windsurf`, `windsurf code editor`, `termux ide`, `android code editor`, `dpkg fix arm64`, `windsurf installer script`, `termux windsurf setup`, `proot windsurf`, `linux arm64 ide`, `raspberry pi windsurf`, `windsurf ubuntu arm`, `termux development tools`, `android programming environment`

---

<div align="center">

<p>
  <sub>© 2025 Mahesh Technicals. All rights reserved.</sub>
</p>

**If this project helped you, please consider giving it a ⭐ on GitHub!**

Made with ❤️ for the ARM64 & Termux community

</div>
