# Flutter Setup and Troubleshooting Guide for Raspberry Pi 5

This guide covers the complete installation process of Flutter on Raspberry Pi 5, including common troubleshooting scenarios.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installing Flutter](#installing-flutter)
- [Setting up Android SDK](#setting-up-android-sdk)
- [Upgrading Flutter and Dependencies](#upgrading-flutter-and-dependencies)
- [Common Issues and Solutions](#common-issues-and-solutions)
- [Building APKs](#building-apks)
- [Best Practices](#best-practices)

## Prerequisites

Before starting, ensure your Raspberry Pi 5 has:
- Raspberry Pi OS 64-bit (recommended)
- At least 8GB of storage available
- Active internet connection
- Updated system packages

```bash
sudo apt update && sudo apt upgrade -y
```

## Installing Flutter

### Step 1: Install Dependencies

```bash
sudo apt install -y git curl unzip xz-utils zip libglu1-mesa
```

### Step 2: Clone Flutter Repository

```bash
cd ~
git clone https://github.com/flutter/flutter.git -b stable
```

### Step 3: Add Flutter to PATH

Edit your shell profile:

```bash
nano ~/.bashrc
```

Add this line at the end:

```bash
export PATH="$PATH:$HOME/flutter/bin"
```

Reload your profile:

```bash
source ~/.bashrc
```

### Step 4: Verify Installation

```bash
flutter doctor
```

## Setting up Android SDK

Since Android Studio isn't available for ARM64, use command-line tools:

### Download Android Command Line Tools

```bash
cd ~
mkdir android-sdk
cd android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
```

### Set Environment Variables

Add to `~/.bashrc`:

```bash
export ANDROID_HOME="$HOME/android-sdk"
export ANDROID_SDK_ROOT="$HOME/android-sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
```

### Install SDK Components

```bash
source ~/.bashrc
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"
flutter doctor --android-licenses
```

## Upgrading Flutter and Dependencies

### Upgrade Flutter Framework

```bash
# Check current version
flutter --version

# Upgrade to latest stable
flutter upgrade

# Switch channels if needed
flutter channel beta    # or dev
flutter upgrade
flutter channel stable  # back to stable
```

### Upgrade Project Dependencies

Navigate to your Flutter project:

```bash
cd your_flutter_project

# Check outdated packages
flutter pub outdated

# Upgrade within constraints
flutter pub upgrade

# Upgrade to major versions (careful!)
flutter pub upgrade --major-versions
```

### Clean Installation

If you encounter issues:

```bash
flutter clean
rm pubspec.lock
flutter pub get
```

## Common Issues and Solutions

### 1. Dependency Conflicts

**Problem**: Package version conflicts like `*fe*analyzer_shared`

**Solution**:
```bash
# Update problematic packages first
flutter pub upgrade custom_lint
flutter pub add *fe*analyzer_shared:^85.0.0

# Or use compatible versions
flutter pub upgrade --major-versions
```

### 2. Java/Gradle Compatibility Issues

**Problem**: "Unsupported class file major version 65"

**Solution**:

1. Check Java version:
```bash
flutter doctor --verbose
```

2. Update Gradle version in `android/gradle/wrapper/gradle-wrapper.properties`:
```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.5-all.zip
```

3. Update Android Gradle Plugin in `android/build.gradle`:
```gradle
dependencies {
    classpath 'com.android.tools.build:gradle:8.1.4'
}
```

4. Clean and rebuild:
```bash
flutter clean
cd android && ./gradlew clean && cd ..
flutter build apk
```

### 3. Android SDK Not Found

**Solution**:
```bash
flutter config --android-sdk $HOME/android-sdk
```

Or skip Android development:
```bash
flutter config --no-enable-android
```

## Building APKs

### Standard Build

```bash
flutter build apk
```

### Build for Specific Architecture

```bash
# ARM64 only (most modern devices)
flutter build apk --target-platform android-arm64

# Multiple architectures
flutter build apk --split-per-abi
```

### Release Build

```bash
flutter build apk --release
```

## Best Practices

### Performance Tips
- Close unnecessary applications during builds
- Use `flutter build apk --split-per-abi` for smaller APK sizes
- Monitor memory usage during compilation

### Development Workflow
1. Always run `flutter doctor` after major changes
2. Keep dependencies updated regularly
3. Test on multiple devices/platforms
4. Use version control before major upgrades

### Troubleshooting Checklist
- [ ] Check Java/Gradle compatibility
- [ ] Verify Android SDK path
- [ ] Clear Flutter cache: `flutter clean`
- [ ] Update dependencies: `flutter pub upgrade`
- [ ] Check for conflicting packages: `flutter pub deps`

## Java/Gradle Compatibility Matrix

| Java Version | Gradle Version | Android Gradle Plugin |
|--------------|----------------|----------------------|
| 8-11         | 7.x           | 7.x                  |
| 17           | 7.3+          | 7.3+                 |
| 21           | 8.5+          | 8.1+                 |

## Useful Commands

```bash
# Check Flutter installation
flutter doctor -v

# List available devices
flutter devices

# Create new project
flutter create my_app

# Run on web
flutter run -d chrome

# Run on desktop
flutter run -d linux

# Check package dependencies
flutter pub deps

# Repair pub cache
flutter pub cache repair

# Clean Gradle cache
rm -rf ~/.gradle/caches/
```

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Gradle Compatibility Guide](https://docs.gradle.org/current/userguide/compatibility.html#java)
- [Android Developer Documentation](https://developer.android.com/)

## Notes

- Build times on Raspberry Pi 5 will be slower than desktop machines
- Consider using web/desktop development for faster iteration
- APK builds require significant memory - close other applications
- Keep your Raspberry Pi OS updated for best compatibility

---

*Last updated: August 26, 2025*