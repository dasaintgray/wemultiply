# Flutter Flavors Guide

Complete guide to using Flutter flavors for environment-specific configuration in the WM Flutter app.

## Table of Contents

1. [Introduction](#introduction)
2. [Architecture](#architecture)
3. [Available Flavors](#available-flavors)
4. [Running the App](#running-the-app)
5. [Building the App](#building-the-app)
6. [VS Code Integration](#vs-code-integration)
7. [Troubleshooting](#troubleshooting)
8. [Best Practices](#best-practices)

---

## Introduction

### What are Flavors?

Flavors allow you to create multiple versions of your app from a single codebase, each with different configurations. This is essential for:

- **Separating environments**: Development, Staging, and Production
- **Different server URLs**: Connect to different backend servers
- **Side-by-side installation**: Install multiple versions on the same device
- **Environment-specific features**: Enable/disable features based on environment

### Benefits

- ✅ **Easy environment switching**: Change environments without code modifications
- ✅ **Parallel testing**: Test different environments simultaneously
- ✅ **Reduced errors**: Eliminate manual URL changes
- ✅ **Better workflow**: Clear separation between dev, staging, and production

---

## Architecture

### Environment Configuration Structure

```
wm_flutter/
├── lib/
│   ├── env/
│   │   ├── env_config.dart           # Abstract interface
│   │   ├── development_config.dart   # Development configuration
│   │   ├── staging_config.dart       # Staging configuration
│   │   └── production_config.dart    # Production configuration
│   ├── main.dart                     # Default entry (Development)
│   ├── main_development.dart         # Development entry point
│   ├── main_staging.dart             # Staging entry point
│   ├── main_production.dart          # Production entry point
│   └── app.dart                      # Main app widget
```

### How It Works

```
┌─────────────────────────┐
│   main_staging.dart     │
│  Creates StagingConfig  │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│    AppInitializer       │
│  - Sets CoreConstant    │
│  - Initializes SpcCore  │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│       MyApp             │
│  Connects to:           │
│  api.wemultiply.store   │
└─────────────────────────┘
```

---

## Available Flavors

### Development

**Purpose**: Local development and testing

**Configuration:**
- **Server URL**: `http://localhost:8080/`
- **CDN URL**: `http://localhost:8888/`
- **App Name**: "WM Dev"
- **Bundle ID**: `com.henrymempin.wm_flutter.dev`

**Use When:**
- Developing new features locally
- Testing with local Serverpod server
- Rapid iteration with hot reload

### Staging

**Purpose**: Pre-production testing outside local network

**Configuration:**
- **Server URL**: `https://api.wemultiply.store/`
- **CDN URL**: `https://cdn.wemultiply.store/`
- **App Name**: "WM Staging"
- **Bundle ID**: `com.henrymempin.wm_flutter.staging`

**Use When:**
- Testing on physical devices outside your network
- User acceptance testing (UAT)
- Integration testing with staging backend
- Final testing before production release

### Production

**Purpose**: Live app for real users

**Configuration:**
- **Server URL**: `https://wmapi.mooo.com/`
- **CDN URL**: `http://122.53.52.217:8888/`
- **App Name**: "WeMultiply"
- **Bundle ID**: `com.henrymempin.wm_flutter`

**Use When:**
- Building release for app stores
- Serving real users
- Production deployment only

---

## Running the App

### From VS Code (Recommended)

1. Open VS Code in the `wm` directory
2. Press `F5` or go to **Run and Debug**
3. Select your desired flavor:
   - **wm_flutter**: Default (Development)
   - **wm_flutter (Development)**: Development flavor
   - **wm_flutter (Staging)**: Staging flavor
   - **wm_flutter (Production)**: Production flavor
4. Click the play button or press `F5`

### From Command Line

#### Development

```bash
cd wm_flutter

# Run on connected device
flutter run --flavor development -t lib/main_development.dart

# Run on specific device
flutter run --flavor development -t lib/main_development.dart -d <device-id>

# Run on iOS simulator
flutter run --flavor development -t lib/main_development.dart -d "iPhone 15"
```

#### Staging

```bash
cd wm_flutter
flutter run --flavor staging -t lib/main_staging.dart
```

#### Production

```bash
cd wm_flutter
flutter run --flavor production -t lib/main_production.dart
```

### List Available Devices

```bash
flutter devices
```

---

## Building the App

### Android APK

#### Development Build

```bash
cd wm_flutter
flutter build apk --flavor development -t lib/main_development.dart
```

Output: `build/app/outputs/flutter-apk/app-development-release.apk`

#### Staging Build

```bash
flutter build apk --flavor staging -t lib/main_staging.dart
```

Output: `build/app/outputs/flutter-apk/app-staging-release.apk`

#### Production Build

```bash
flutter build apk --flavor production -t lib/main_production.dart
```

Output: `build/app/outputs/flutter-apk/app-production-release.apk`

### Android App Bundle (for Google Play)

```bash
# Production
flutter build appbundle --flavor production -t lib/main_production.dart

# Staging (for internal testing track)
flutter build appbundle --flavor staging -t lib/main_staging.dart
```

### iOS

```bash
# Development
flutter build ios --flavor development -t lib/main_development.dart

# Staging
flutter build ios --flavor staging -t lib/main_staging.dart

# Production (for App Store)
flutter build ios --flavor production -t lib/main_production.dart
```

**Note**: For iOS, you may need to configure schemes in Xcode for each flavor.

---

## VS Code Integration

### Available Launch Configurations

The `.vscode/launch.json` file provides these configurations:

1. **wm_flutter**: Default development mode
2. **wm_flutter (Development)**: Explicit development flavor
3. **wm_flutter (Staging)**: Staging flavor with staging server
4. **wm_flutter (Production)**: Production flavor with production server
5. **wm_flutter (profile mode)**: Performance profiling
6. **wm_flutter (release mode)**: Release mode testing

### How to Use

1. Open the **Run and Debug** panel (`Ctrl+Shift+D` or `Cmd+Shift+D`)
2. Select your desired configuration from the dropdown
3. Press `F5` to start debugging
4. The app will launch on your connected device/emulator

### Switching Between Flavors

To switch environments while debugging:

1. Stop the current debug session (`Shift+F5`)
2. Select a different flavor from the dropdown
3. Start debugging again (`F5`)

---

## Troubleshooting

### Common Issues

#### 1. Flavor Not Recognized (Android)

**Error**: `Flavor 'staging' is not recognized`

**Solution**:
```bash
cd wm_flutter/android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run --flavor staging -t lib/main_staging.dart
```

#### 2. Build Configuration Missing

**Error**: `No build variant found for flavor`

**Solution**: Ensure [android/app/build.gradle.kts](../wm_flutter/android/app/build.gradle.kts) has the correct flavor configuration:

```kotlin
flavorDimensions += "environment"

productFlavors {
    create("development") {
        dimension = "environment"
        applicationIdSuffix = ".dev"
    }
    // ... other flavors
}
```

#### 3. Server Connection Failed

**Symptoms**: App launches but can't connect to server

**Solutions**:
- **Development**: Ensure local Serverpod server is running on `localhost:8080`
- **Staging**: Verify staging server is accessible at `https://api.wemultiply.store`
- **Production**: Check production server status

**Test Connection**:
```bash
# Development
curl http://localhost:8080

# Staging
curl https://api.wemultiply.store

# Production
curl https://wmapi.mooo.com
```

#### 4. Import Errors After Adding Flavors

**Error**: Cannot resolve imports for `env_config.dart`

**Solution**:
```bash
flutter clean
flutter pub get
```

#### 5. iOS Scheme Not Found

**Error**: Scheme 'staging' not found

**Solution**: Configure iOS schemes in Xcode:
1. Open `ios/Runner.xcworkspace` in Xcode
2. Product → Scheme → Manage Schemes
3. Duplicate the Runner scheme for each flavor
4. Configure each scheme to use the appropriate main_*.dart file

---

## Best Practices

### When to Use Which Flavor

| Scenario | Flavor | Reason |
|----------|--------|--------|
| Local feature development | Development | Fast iteration with hot reload |
| Testing on physical device | Development or Staging | Depends on network access needs |
| UAT with stakeholders | Staging | Production-like without affecting real users |
| Beta testing | Staging | Safe environment for testers |
| App Store submission | Production | Live users only |
| Emergency hotfix testing | Staging → Production | Test in staging first |

### Configuration Management

**DO:**
- ✅ Use flavors for environment-specific URLs
- ✅ Keep sensitive data out of code (use environment variables or secure storage)
- ✅ Test staging before deploying to production
- ✅ Use meaningful app names to distinguish flavors

**DON'T:**
- ❌ Hardcode API keys or secrets in config files
- ❌ Use production flavor during development
- ❌ Skip staging testing
- ❌ Commit `.env` files with real credentials

### Side-by-Side Installation

All three flavors can be installed simultaneously on the same device because they have different bundle IDs:

- Development: `com.henrymempin.wm_flutter.dev`
- Staging: `com.henrymempin.wm_flutter.staging`
- Production: `com.henrymempin.wm_flutter`

This allows you to:
- Compare behaviors across environments
- Test updates without affecting stable versions
- Switch between environments quickly

### Testing Workflow

**Recommended Flow**:

1. **Develop**: Use Development flavor locally
2. **Test**: Build Staging APK for device testing
3. **UAT**: Distribute Staging build to testers
4. **Release**: Build Production for store submission

```bash
# Daily development
flutter run --flavor development -t lib/main_development.dart

# Before PR/merge
flutter run --flavor staging -t lib/main_staging.dart

# Release preparation
flutter build appbundle --flavor production -t lib/main_production.dart
```

---

## Quick Reference

### Command Summary

```bash
# Run Development
flutter run --flavor development -t lib/main_development.dart

# Run Staging
flutter run --flavor staging -t lib/main_staging.dart

# Run Production
flutter run --flavor production -t lib/main_production.dart

# Build All Flavors
flutter build apk --flavor development -t lib/main_development.dart
flutter build apk --flavor staging -t lib/main_staging.dart
flutter build apk --flavor production -t lib/main_production.dart

# Clean and Rebuild
flutter clean && flutter pub get && flutter run --flavor staging -t lib/main_staging.dart
```

### Environment URLs

| Environment | API Server | CDN Server |
|-------------|------------|------------|
| Development | http://localhost:8080/ | http://localhost:8888/ |
| Staging | https://api.wemultiply.store/ | https://cdn.wemultiply.store/ |
| Production | https://wmapi.mooo.com/ | http://122.53.52.217:8888/ |

---

## Additional Resources

- [Flutter Flavors Official Documentation](https://docs.flutter.dev/deployment/flavors)
- [Android Product Flavors](https://developer.android.com/build/build-variants)
- [iOS Schemes and Configurations](https://developer.apple.com/documentation/xcode/customizing-the-build-schemes-for-a-project)

---

**Last Updated**: 2026-02-05
**Version**: 1.0.0
