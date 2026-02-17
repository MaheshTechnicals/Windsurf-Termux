# 🌊 Windsurf Toolkit for Termux (ARM64)

> **Author:** Mahesh Technicals\
> **Version:** v1.3

[![Termux](https://img.shields.io/badge/Platform-Termux%20%7C%20Linux%20ARM64-blue?style=for-the-badge&logo=linux)](https://termux.com/)
[![Bash](https://img.shields.io/badge/Written%20in-Bash-success?style=for-the-badge&logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-orange?style=for-the-badge)](LICENSE)

A powerful, automated toolkit to install, update, and fix **Windsurf
Editor** on ARM64 devices (Android Termux, Linux, Proot). This tool
bypasses the common `dpkg` memory corruption bugs
(`double free or corruption`) by handling the decompression process
manually.

------------------------------------------------------------------------

## ✨ Features

-   🚀 **Smart Installation:** Automatically detects if Windsurf is
    already installed.
-   📦 **Bug Bypass:** Uses `7zip` + `tar` to safely unpack `.deb`
    files, fixing installation crashes on ARM64.
-   🔄 **Auto-Updates:** Checks for newer versions before downloading.
    If up-to-date, it asks before reinstalling.
-   🛠️ **Auto-Patcher:**
    -   Fixes `--no-sandbox` issues for desktop shortcuts.
    -   Injects optimized `settings.json` for smoother performance.
-   🎨 **Modern UI:** Clean, gradient-style terminal interface with
    progress bars and emojis.

------------------------------------------------------------------------

## 📥 Installation

Run the following command in your Termux or Linux terminal:

``` bash
# Download the script
wget https://raw.githubusercontent.com/MaheshTechnicals/Windsurf-Termux/main/windsurf-toolkit.sh

# Make it executable
chmod +x windsurf-toolkit.sh

# Run the toolkit
./windsurf-toolkit.sh
```

> If you don't have `wget`, install it first: `pkg install wget`

------------------------------------------------------------------------

## 📖 Usage Guide

Once the script is running, you will see the **Mahesh Technicals** menu:

### 1️⃣ Install or Update Windsurf

-   Downloads the latest `.deb` package directly from the official
    source.
-   Repackages it to fix the `zstd` compression bug.
-   Installs it via `dpkg`.
-   Applies sandbox and JSON config fixes automatically.

### 2️⃣ Uninstall Windsurf

-   Completely removes Windsurf and cleans up dependencies.

### 3️⃣ Exit

-   Closes the toolkit.

------------------------------------------------------------------------

## 🔧 What Does It Fix?

### 1. The `dpkg` Crash

Common ARM64 error:

    double free or corruption (out)
    dpkg-deb: error: <decompress> subprocess was killed by signal (Aborted)

**Solution:**\
The toolkit extracts the `.deb` using `7zip` and repackages it using
`gzip` to ensure compatibility with `dpkg`.

------------------------------------------------------------------------

### 2. Sandbox Errors

Electron apps like Windsurf often refuse to launch as root or in
containers.

**Solution:**\
Automatically patches `.desktop` file to include `--no-sandbox` flags.

------------------------------------------------------------------------

### 3. VS Code / Windsurf Settings Optimization

Injected configuration:

``` json
{
  "extensions.verifySignature": false,
  "settingsSync.keychain": false,
  "security.workspace.trust.enabled": false
}
```

------------------------------------------------------------------------

## 👨‍💻 Credits

-   Script & Automation: **Mahesh Technicals**
-   Toolkit Version: **1.3**

------------------------------------------------------------------------

## ⚠️ Disclaimer

This tool is for educational purposes and helps run Windsurf on
non-standard environments.\
It is not officially affiliated with Codeium or Windsurf.
