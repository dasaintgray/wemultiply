# Complete Staging Environment Setup Guide

End-to-end guide for setting up and using the complete staging environment (Serverpod server + Flutter app).

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Server Setup](#server-setup)
4. [Flutter App Setup](#flutter-app-setup)
5. [Testing the Complete Flow](#testing-the-complete-flow)
6. [Deployment](#deployment)
7. [Monitoring](#monitoring)
8. [Common Workflows](#common-workflows)

---

## Overview

### Purpose

The staging environment allows you to test your Flutter app outside your local network, connecting to a production-like server infrastructure before deploying to production.

### Architecture

```
┌─────────────────────────────────────────────────────┐
│                  Internet (HTTPS)                    │
└──────────────────┬──────────────────────────────────┘
                   │
       ┌───────────┴───────────┐
       │  Traefik (SSL/TLS)    │
       │  api.wemultiply.store │
       └───────────┬───────────┘
                   │
       ┌───────────┴───────────┐
       │  Serverpod Server     │
       │  - API Server         │
       │  - Insights Server    │
       │  - Web Server         │
       │  - Xendit Integration │
       └───────────┬───────────┘
                   │
       ┌───────────┴───────────┐
       │  PostgreSQL Database  │
       │  (with pgvector)      │
       └───────────────────────┘

                   ↕

       ┌───────────────────────┐
       │  Flutter App (Staging)│
       │  - Staging Flavor     │
       │  - Production-like UI │
       └───────────────────────┘
```

### What You'll Setup

1. **Server Infrastructure**: Docker Compose staging environment with SSL
2. **Flutter App**: Staging flavor configured to connect to staging server
3. **Payment Integration**: Xendit development keys for testing
4. **Monitoring**: Logs and debugging tools

---

## Prerequisites

### Required Tools

- **Docker & Docker Compose**: For server deployment
  ```bash
  docker --version
  docker-compose --version
  ```

- **Flutter SDK**: For app development
  ```bash
  flutter --version
  ```

- **Git**: For version control
  ```bash
  git --version
  ```

### Required Access

- **Server**: Access to a server/VPS where staging will be deployed
- **DNS**: Ability to configure DNS records for your domains
- **GitHub**: Access to GitHub Container Registry (if using private images)

### Domain Names

Ensure these domains point to your staging server:
- `api.wemultiply.store`
- `wminsights.wemultiply.store`
- `ws.wemultiply.store`

---

## Server Setup

### Step 1: Prepare Environment File

Navigate to the server directory:

```bash
cd wm_server
```

Copy the staging environment file:

```bash
cp .env.staging.example .env.staging
```

### Step 2: Configure Credentials

Edit `.env.staging` with your actual values:

```bash
nano .env.staging  # or use your preferred editor
```

**Critical Values to Update**:

```bash
# GitHub Container Registry
GHCR_ORG=your-github-organization

# Database (use values from config/passwords.yaml)
POSTGRES_PASSWORD=qIjiRT9Vq_iTBf1SXd6XaeM2Q4OzMDnj
SERVERPOD_DATABASE_PASSWORD=qIjiRT9Vq_iTBf1SXd6XaeM2Q4OzMDnj

# Service Secret (from config/passwords.yaml)
SERVERPOD_SERVICE_SECRET=5HFr0vWMjfqyhUCe2sa4TkX_l9uTlOK1

# Xendit (use development keys)
XENDIT_SECRET_KEY=xnd_development_your_key_here
XENDIT_PUBLIC_KEY=xnd_public_development_your_key_here
XENDIT_WEBHOOK_TOKEN=your_webhook_token
XENDIT_CALLBACK_URL=https://your-pipedream-url.m.pipedream.net
```

### Step 3: Verify Configuration

Check that your configuration is valid:

```bash
docker-compose -f docker-compose.staging.yaml --env-file .env.staging config
```

This should output the complete configuration without errors.

### Step 4: Start the Server

Launch all services:

```bash
docker-compose -f docker-compose.staging.yaml --env-file .env.staging up -d
```

### Step 5: Verify Server is Running

Check service status:

```bash
docker-compose -f docker-compose.staging.yaml ps
```

Expected output:
```
NAME                  STATUS              PORTS
traefik              Up                  80/tcp, 443/tcp
postgres             Up (healthy)        8090->5432/tcp
serverpod            Up                  (via traefik)
```

View logs:

```bash
docker-compose -f docker-compose.staging.yaml logs -f
```

### Step 6: Test API Endpoints

Test each endpoint:

```bash
# API Server
curl https://api.wemultiply.store

# Insights Server
curl https://wminsights.wemultiply.store

# Web Server
curl https://ws.wemultiply.store
```

All should return a response (may be 404 if no route configured, but not connection error).

---

## Flutter App Setup

### Step 1: Verify Flavor Configuration

The staging flavor is pre-configured. Verify the files exist:

```bash
cd wm_flutter

# Check environment configs
ls -l lib/env/

# Check flavor entry points
ls -l lib/main_*.dart

# Check Android flavors
cat android/app/build.gradle.kts | grep -A 20 "productFlavors"
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

### Step 3: Run Staging Flavor Locally First

Test the staging configuration on your local machine:

```bash
flutter run --flavor staging -t lib/main_staging.dart
```

This will connect to the staging server at `https://api.wemultiply.store`.

**Verify**:
- App launches successfully
- Loads data from staging server
- No SSL/TLS errors

### Step 4: Build Staging APK

Build an APK for testing on physical devices:

```bash
flutter build apk --flavor staging -t lib/main_staging.dart
```

Output location: `build/app/outputs/flutter-apk/app-staging-release.apk`

### Step 5: Install on Test Device

Transfer the APK to your test device:

```bash
# Via ADB
adb install build/app/outputs/flutter-apk/app-staging-release.apk

# Or upload to a file sharing service and download on device
```

### Step 6: Verify App Connects

On your test device:
1. Open the "WM Staging" app
2. It should connect to `https://api.wemultiply.store`
3. Test basic functionality (login, browse products, etc.)

---

## Testing the Complete Flow

### Test Checklist

Use this checklist to verify your staging environment:

#### Server Tests

- [ ] Server responds at `https://api.wemultiply.store`
- [ ] SSL certificate is valid (no browser warnings)
- [ ] Database migrations applied successfully
- [ ] Server logs show no errors

#### Flutter App Tests

- [ ] App installs successfully
- [ ] App name shows "WM Staging"
- [ ] Can be installed alongside development and production versions
- [ ] Connects to staging server successfully

#### Functional Tests

- [ ] **User Authentication**
  - [ ] Sign up with email
  - [ ] Email verification works
  - [ ] Login successful
  - [ ] Logout successful

- [ ] **Product Browsing**
  - [ ] Products load from server
  - [ ] Images load from CDN
  - [ ] Product details display correctly

- [ ] **Shopping Cart**
  - [ ] Add products to cart
  - [ ] Update quantities
  - [ ] Remove items
  - [ ] Cart persists after app restart

- [ ] **Payment Flow** (Xendit Development Mode)
  - [ ] Initiate payment
  - [ ] Select payment method
  - [ ] Complete test payment
  - [ ] Webhook received (check Pipedream)
  - [ ] Order status updates correctly

- [ ] **User Profile**
  - [ ] View profile information
  - [ ] Update profile
  - [ ] Add/edit delivery addresses

### Example Test Commands

```bash
# Check server health
curl https://api.wemultiply.store/health

# Test database connection
docker-compose -f docker-compose.staging.yaml exec postgres psql -U postgres -d wm -c "SELECT COUNT(*) FROM users;"

# View recent server logs
docker-compose -f docker-compose.staging.yaml logs --tail=50 serverpod

# Check Traefik routing
docker-compose -f docker-compose.staging.yaml logs traefik | grep "api.wemultiply.store"
```

---

## Deployment

### Deploying Server Updates

When you have server code changes:

1. **Build and push Docker image**:
   ```bash
   cd wm_server
   docker build -f Dockerfile.prod -t ghcr.io/your-org/wm_server:staging .
   docker push ghcr.io/your-org/wm_server:staging
   ```

2. **Pull and restart on server**:
   ```bash
   docker-compose -f docker-compose.staging.yaml pull serverpod
   docker-compose -f docker-compose.staging.yaml up -d serverpod
   ```

3. **Verify deployment**:
   ```bash
   docker-compose -f docker-compose.staging.yaml logs -f serverpod
   ```

### Deploying Flutter App Updates

When you have Flutter app changes:

1. **Build new APK**:
   ```bash
   cd wm_flutter
   flutter build apk --flavor staging -t lib/main_staging.dart
   ```

2. **Distribute to testers**:
   - Upload to Firebase App Distribution
   - Send via email/chat
   - Use internal testing track on Play Store

3. **Test on multiple devices**:
   - Different Android versions
   - Different screen sizes
   - Different network conditions

---

## Monitoring

### Server Monitoring

#### View Real-time Logs

```bash
cd wm_server

# All services
docker-compose -f docker-compose.staging.yaml logs -f

# Specific service
docker-compose -f docker-compose.staging.yaml logs -f serverpod
```

#### Check Resource Usage

```bash
docker stats
```

#### Database Monitoring

```bash
# Connect to database
docker-compose -f docker-compose.staging.yaml exec postgres psql -U postgres -d wm

# Check active connections
SELECT count(*) FROM pg_stat_activity;

# Check table sizes
SELECT schemaname, tablename, pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC
LIMIT 10;
```

### Webhook Monitoring

If using Pipedream for Xendit webhooks:

1. Go to your Pipedream workflow
2. View incoming webhook events
3. Inspect payload and response
4. Debug any webhook issues

### Flutter App Monitoring

#### Debugging on Device

```bash
# Connect device and view logs
flutter logs

# Or use ADB
adb logcat | grep flutter
```

#### Performance Profiling

```bash
# Run in profile mode
flutter run --flavor staging -t lib/main_staging.dart --profile
```

---

## Common Workflows

### Daily Development Workflow

```bash
# 1. Develop locally
cd wm_flutter
flutter run --flavor development -t lib/main_development.dart

# 2. Test changes locally
# ... make code changes ...

# 3. Test on staging
flutter run --flavor staging -t lib/main_staging.dart

# 4. Build staging APK for device testing
flutter build apk --flavor staging -t lib/main_staging.dart

# 5. Install on test device
adb install build/app/outputs/flutter-apk/app-staging-release.apk
```

### Pre-Release Testing Workflow

```bash
# 1. Ensure staging server is up to date
cd wm_server
docker-compose -f docker-compose.staging.yaml pull
docker-compose -f docker-compose.staging.yaml up -d

# 2. Build staging app
cd wm_flutter
flutter build apk --flavor staging -t lib/main_staging.dart

# 3. Distribute to QA team
# Upload to Firebase App Distribution or similar

# 4. Collect feedback
# Monitor logs, gather bug reports

# 5. Fix issues and repeat
```

### Hotfix Testing Workflow

```bash
# 1. Create hotfix branch
git checkout -b hotfix/issue-description

# 2. Make fix
# ... code changes ...

# 3. Test locally first
flutter run --flavor development -t lib/main_development.dart

# 4. Deploy to staging
# Deploy server changes (if any)
# Build and test staging app

# 5. Verify fix in staging
# Complete test flow

# 6. Deploy to production (if successful)
```

---

## Quick Reference

### Important URLs

| Service | URL |
|---------|-----|
| API Server | https://api.wemultiply.store |
| Insights Server | https://wminsights.wemultiply.store |
| Web Server | https://ws.wemultiply.store |

### Important Commands

```bash
# Start staging server
docker-compose -f docker-compose.staging.yaml --env-file .env.staging up -d

# Stop staging server
docker-compose -f docker-compose.staging.yaml down

# View logs
docker-compose -f docker-compose.staging.yaml logs -f

# Run staging app
flutter run --flavor staging -t lib/main_staging.dart

# Build staging APK
flutter build apk --flavor staging -t lib/main_staging.dart

# Clean and rebuild
flutter clean && flutter pub get && flutter run --flavor staging -t lib/main_staging.dart
```

### Important Files

| File | Purpose |
|------|---------|
| `wm_server/.env.staging` | Staging environment variables |
| `wm_server/config/staging.yaml` | Staging server configuration |
| `wm_server/config/passwords.yaml` | Credentials for all environments |
| `wm_flutter/lib/env/staging_config.dart` | Staging app configuration |
| `wm_flutter/lib/main_staging.dart` | Staging entry point |

---

## Next Steps

After completing the staging setup:

1. **Document Your Setup**: Add any environment-specific notes
2. **Train Your Team**: Ensure everyone knows how to use staging
3. **Setup CI/CD**: Automate builds and deployments
4. **Monitor Regularly**: Check staging health periodically
5. **Keep Updated**: Pull latest changes regularly

---

## Additional Resources

- [Docker Compose Staging Guide](docker-compose-staging-guide.md) - Detailed server setup
- [Flutter Flavors Guide](flutter-flavors-guide.md) - Complete flavors documentation
- [Serverpod Documentation](https://docs.serverpod.dev/) - Official Serverpod docs
- [Xendit Documentation](https://developers.xendit.co/) - Payment integration docs

---

**Last Updated**: 2026-02-05
**Version**: 1.0.0
