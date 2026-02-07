# Docker Compose Staging Environment Guide

## Table of Contents

1. [Introduction](#introduction)
2. [Architecture Overview](#architecture-overview)
3. [Prerequisites](#prerequisites)
4. [Configuration](#configuration)
5. [Usage Instructions](#usage-instructions)
6. [Service Endpoints](#service-endpoints)
7. [Database Management](#database-management)
8. [Traefik Dashboard](#traefik-dashboard)
9. [Differences from Production](#differences-from-production)
10. [Troubleshooting](#troubleshooting)
11. [Security Considerations](#security-considerations)

---

## Introduction

### Purpose of Staging Environment

The staging environment is designed to closely mirror your production environment while providing a safe space for final testing before deploying to production. It uses the same infrastructure components (Traefik, PostgreSQL, Serverpod) but with staging-specific configurations and domains.

### When to Use Each Environment

- **Development**: Local development with hot reload, uses [docker-compose.yaml](../wm_server/docker-compose.yaml)
- **Staging**: Pre-production testing with production-like setup, uses [docker-compose.staging.yaml](../wm_server/docker-compose.staging.yaml)
- **Production**: Live environment serving real users, uses [docker-compose.production.yaml](../wm_server/docker-compose.production.yaml)

---

## Architecture Overview

The staging environment consists of four main services:

```
┌─────────────────────────────────────────────────────────┐
│                    Internet (HTTPS)                      │
└────────────────────┬────────────────────────────────────┘
                     │
         ┌───────────┴───────────┐
         │      Traefik v3.0     │  (Reverse Proxy + SSL)
         │   Let's Encrypt SSL   │
         └───────────┬───────────┘
                     │
      ┏━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┓
      ┃                             ┃
      ┃  Serverpod Server (Staging) ┃
      ┃  ┌────────────────────────┐ ┃
      ┃  │  API Server :8080      │ ┃  → api.wemultiply.store
      ┃  │  Insights Server :8081 │ ┃  → wminsights.wemultiply.store
      ┃  │  Web Server :8082      │ ┃  → ws.wemultiply.store
      ┃  └────────────────────────┘ ┃
      ┗━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┛
                     │
         ┌───────────┴───────────┐
         │  PostgreSQL (pgvector)│
         │  Port: 8090 → 5432    │
         │  Database: wm          │
         └───────────────────────┘
```

### Services

1. **Traefik**: Reverse proxy handling SSL/TLS termination and routing traffic to appropriate Serverpod servers
2. **PostgreSQL**: Database with pgvector extension for vector operations
3. **Serverpod**: Your application server running in staging mode with three sub-servers
4. **Redis** (Optional): Caching layer, disabled by default in staging

---

## Prerequisites

### Required Software

- **Docker**: Version 20.10 or higher
  ```bash
  docker --version
  ```

- **Docker Compose**: Version 2.0 or higher
  ```bash
  docker-compose --version
  ```

### Domain Configuration

Ensure the following domains are configured in your DNS to point to your staging server:

- `api.wemultiply.store` → Staging server IP
- `wminsights.wemultiply.store` → Staging server IP
- `ws.wemultiply.store` → Staging server IP
- `db.wemultiply.store` → Staging server IP (if accessing externally)

### GitHub Container Registry Access

If your Serverpod image is private, you need to authenticate with GitHub Container Registry:

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
```

---

## Configuration

### Step 1: Create Environment File

Copy the example environment file and fill in your values:

```bash
cd wm_server
cp .env.staging.example .env.staging
```

### Step 2: Edit Environment Variables

Open `.env.staging` and update the following critical values:

#### Required Updates

```bash
# GitHub organization/username for pulling Docker images
GHCR_ORG=your-github-org

# Database password (use a strong password)
POSTGRES_PASSWORD=your-secure-postgres-password
SERVERPOD_DATABASE_PASSWORD=your-secure-postgres-password

# Service secret (generate with: openssl rand -base64 32)
SERVERPOD_SERVICE_SECRET=your-secure-service-secret
```

#### Optional Updates

If your domains differ from the defaults, update:

```bash
SERVERPOD_API_SERVER_PUBLIC_HOST=api.wemultiply.store
SERVERPOD_INSIGHTS_SERVER_PUBLIC_HOST=wminsights.wemultiply.store
SERVERPOD_WEB_SERVER_PUBLIC_HOST=ws.wemultiply.store
```

### Step 3: Configure Xendit Payment Gateway

For staging environment, you'll use Xendit development keys for testing:

```bash
# Xendit credentials (development keys for staging)
XENDIT_SECRET_KEY=xnd_development_your_key_here
XENDIT_PUBLIC_KEY=xnd_public_development_your_key_here
XENDIT_BASE_URL=https://api.xendit.co

# Webhook configuration
XENDIT_WEBHOOK_TOKEN=your_webhook_token
XENDIT_SUCCESS_REDIRECT_URL=https://api.wemultiply.store/payment/success
XENDIT_FAILURE_REDIRECT_URL=https://api.wemultiply.store/payment/failure

# For testing, use a webhook testing service like Pipedream
XENDIT_CALLBACK_URL=https://your-pipedream-url.m.pipedream.net
```

**Notes:**
- Use Xendit **development keys** (starting with `xnd_development_`) for staging
- These keys are safe to use in staging and won't charge real money
- For webhook testing, use services like [Pipedream](https://pipedream.com/) or [RequestBin](https://requestbin.com/)
- Update redirect URLs to match your staging domain

### Step 4: Verify Configuration

The staging configuration is defined in [config/staging.yaml](../wm_server/config/staging.yaml). The docker-compose file reads environment variables and passes them to Serverpod, which then uses the staging.yaml configuration when `--mode staging` is specified.

### Environment Variables Explanation

| Variable | Description | Default |
|----------|-------------|---------|
| `GHCR_ORG` | GitHub organization for container registry | Required |
| `POSTGRES_USER` | PostgreSQL username | `postgres` |
| `POSTGRES_DB` | PostgreSQL database name | `wm` |
| `POSTGRES_PASSWORD` | PostgreSQL password | Required |
| `SERVERPOD_DATABASE_HOST` | Database hostname (internal) | `postgres` |
| `SERVERPOD_DATABASE_PORT` | Database port (internal) | `5432` |
| `SERVERPOD_SERVICE_SECRET` | Service authentication secret | Required |
| `SERVERPOD_MAX_REQUEST_SIZE` | Max request size in bytes | `524288` |

---

## Usage Instructions

### Starting the Staging Environment

Navigate to the `wm_server` directory and run:

```bash
# Start all services in detached mode
docker-compose -f docker-compose.staging.yaml --env-file .env.staging up -d
```

This will:
1. Pull the latest Docker images
2. Start PostgreSQL and wait for it to be healthy
3. Start Serverpod server (which will apply migrations automatically)
4. Start Traefik and configure SSL certificates
5. Route traffic to the appropriate servers

### Viewing Logs

View logs for all services:

```bash
docker-compose -f docker-compose.staging.yaml logs -f
```

View logs for a specific service:

```bash
# Serverpod logs
docker-compose -f docker-compose.staging.yaml logs -f serverpod

# PostgreSQL logs
docker-compose -f docker-compose.staging.yaml logs -f postgres

# Traefik logs
docker-compose -f docker-compose.staging.yaml logs -f traefik
```

### Checking Service Status

```bash
docker-compose -f docker-compose.staging.yaml ps
```

Expected output:
```
NAME                STATUS              PORTS
traefik             Up                  80/tcp, 443/tcp
postgres            Up (healthy)        8090->5432/tcp
serverpod           Up                  (via traefik)
```

### Stopping the Staging Environment

Stop all services (keeps data volumes):

```bash
docker-compose -f docker-compose.staging.yaml down
```

Stop and remove volumes (⚠️ **DELETES ALL DATA**):

```bash
docker-compose -f docker-compose.staging.yaml down -v
```

### Rebuilding After Code Changes

If you've updated your code and pushed a new Docker image:

```bash
# Pull the latest image
docker-compose -f docker-compose.staging.yaml pull serverpod

# Recreate the serverpod container
docker-compose -f docker-compose.staging.yaml up -d serverpod
```

### Restarting a Single Service

```bash
docker-compose -f docker-compose.staging.yaml restart serverpod
```

---

## Service Endpoints

### Public HTTPS Endpoints

Once deployed, your services will be available at:

| Service | URL | Internal Port |
|---------|-----|---------------|
| API Server | https://api.wemultiply.store | 8080 |
| Insights Server | https://wminsights.wemultiply.store | 8081 |
| Web Server | https://ws.wemultiply.store | 8082 |

### Testing Endpoints

Test API server health:

```bash
curl https://api.wemultiply.store/health
```

Test with verbose SSL information:

```bash
curl -v https://api.wemultiply.store
```

### Database Access

The PostgreSQL database is exposed on port 8090 (mapped to internal port 5432):

```bash
# From the host machine
psql -h localhost -p 8090 -U postgres -d wm

# From another Docker container on the same network
psql -h postgres -p 5432 -U postgres -d wm
```

---

## Database Management

### Connecting to PostgreSQL

#### From Host Machine

```bash
# Using psql
psql -h localhost -p 8090 -U postgres -d wm

# Using Docker exec
docker-compose -f docker-compose.staging.yaml exec postgres psql -U postgres -d wm
```

#### Using a GUI Tool

Configure your database client (pgAdmin, DBeaver, etc.) with:

- **Host**: `localhost` (or your server IP)
- **Port**: `8090`
- **Database**: `wm`
- **Username**: `postgres`
- **Password**: (from your `.env.staging`)
- **SSL Mode**: `prefer` or `disable` (staging uses internal network)

### Database Migrations

Migrations are automatically applied when the Serverpod container starts (via the `--apply-migrations` flag). Check the logs to verify:

```bash
docker-compose -f docker-compose.staging.yaml logs serverpod | grep migration
```

### Manual Migration Application

If you need to apply migrations manually:

```bash
docker-compose -f docker-compose.staging.yaml exec serverpod /server --mode staging --apply-migrations
```

### Backup Database

Create a backup:

```bash
# Create backup file
docker-compose -f docker-compose.staging.yaml exec postgres pg_dump -U postgres wm > backup_$(date +%Y%m%d_%H%M%S).sql

# Or use Docker volume backup
docker run --rm \
  -v wm_staging_data:/data \
  -v $(pwd):/backup \
  alpine tar czf /backup/postgres_backup_$(date +%Y%m%d_%H%M%S).tar.gz /data
```

### Restore Database

Restore from SQL backup:

```bash
cat backup_20260205_120000.sql | docker-compose -f docker-compose.staging.yaml exec -T postgres psql -U postgres -d wm
```

### Volume Management

List volumes:

```bash
docker volume ls | grep wm_staging
```

Inspect volume:

```bash
docker volume inspect wm_staging_data
```

Remove volume (⚠️ **DELETES ALL DATA**):

```bash
docker volume rm wm_staging_data
```

---

## Traefik Dashboard

### Accessing the Dashboard

Traefik dashboard is accessible at:

```
http://your-server-ip:8080/dashboard/
```

**Note**: The dashboard is configured with `--api.insecure=true` for staging. For production, you should secure this endpoint.

### Monitoring SSL Certificates

In the Traefik dashboard, navigate to:
- **HTTP** → **Routers** to see routing rules
- **HTTP** → **Services** to see backend services
- **HTTP** → **Middlewares** to see middleware chain

### Certificate Storage

SSL certificates are stored in `./letsencrypt-staging/acme.json` on the host machine. This file is automatically created and managed by Traefik.

```bash
# View certificate information
cat ./letsencrypt-staging/acme.json | jq '.myresolver.Certificates[0]'
```

### Force Certificate Renewal

If you need to force certificate renewal:

```bash
# Remove the certificate storage
rm -rf ./letsencrypt-staging

# Restart Traefik
docker-compose -f docker-compose.staging.yaml restart traefik
```

---

## Differences from Production

### Key Differences

| Aspect | Staging | Production |
|--------|---------|------------|
| **Mode Flag** | `--mode staging` | `--mode production` |
| **Config File** | `config/staging.yaml` | `config/production.yaml` |
| **Domains** | `*.wemultiply.store` | Production domains |
| **Database Image** | `pgvector/pgvector:pg16` | `postgres:17` |
| **Database Port** | `8090:5432` | `127.0.0.1:5432:5432` |
| **Network** | `serverpod-staging-network` | `serverpod-network` |
| **Volume** | `wm_staging_data` | `wm_data` |
| **SSL Certificates** | Let's Encrypt staging | Let's Encrypt production |
| **Logging** | More verbose (normal) | Less verbose |
| **Console Logs** | May be enabled | Disabled |

### Database Port Exposure

- **Staging**: Port 8090 is exposed to allow external database tools to connect
- **Production**: Port 5432 is bound to `127.0.0.1` only for security

### Logging Configuration

Staging environment may have more verbose logging enabled. Check [config/staging.yaml](../wm_server/config/staging.yaml):

```yaml
sessionLogs:
  persistentEnabled: true
  consoleEnabled: true
  consoleLogFormat: json
```

---

## Troubleshooting

### Common Issues and Solutions

#### 1. SSL Certificate Not Generated

**Symptoms**:
- Browser shows "SSL certificate not found"
- Traefik logs show "unable to generate a certificate"

**Solutions**:
```bash
# Check Traefik logs
docker-compose -f docker-compose.staging.yaml logs traefik

# Verify DNS is pointing to your server
nslookup api.wemultiply.store

# Ensure ports 80 and 443 are not blocked
sudo netstat -tulpn | grep -E ':80|:443'

# Remove old certificates and restart
rm -rf ./letsencrypt-staging
docker-compose -f docker-compose.staging.yaml restart traefik
```

#### 2. Database Connection Failed

**Symptoms**:
- Serverpod logs show "connection refused"
- Services fail to start

**Solutions**:
```bash
# Check PostgreSQL is healthy
docker-compose -f docker-compose.staging.yaml ps postgres

# Check PostgreSQL logs
docker-compose -f docker-compose.staging.yaml logs postgres

# Verify environment variables
docker-compose -f docker-compose.staging.yaml config | grep -A 20 serverpod

# Test database connection manually
docker-compose -f docker-compose.staging.yaml exec postgres psql -U postgres -d wm -c "SELECT 1;"
```

#### 3. Service Startup Failures

**Symptoms**:
- Container exits immediately after starting
- "Exited (1)" status

**Solutions**:
```bash
# Check service logs for error messages
docker-compose -f docker-compose.staging.yaml logs serverpod

# Verify environment file is loaded
docker-compose -f docker-compose.staging.yaml --env-file .env.staging config

# Check if required environment variables are set
docker-compose -f docker-compose.staging.yaml exec serverpod env | grep SERVERPOD
```

#### 4. Port Conflicts

**Symptoms**:
- "port is already allocated" error
- Services fail to bind to ports

**Solutions**:
```bash
# Check what's using the ports
sudo netstat -tulpn | grep -E ':80|:443|:8090|:8091'

# Stop conflicting services
sudo systemctl stop nginx  # or apache2, or other web servers

# Or change ports in docker-compose.staging.yaml if needed
```

#### 5. Image Pull Failures

**Symptoms**:
- "pull access denied" error
- "manifest unknown" error

**Solutions**:
```bash
# Authenticate with GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u YOUR_USERNAME --password-stdin

# Verify GHCR_ORG is set correctly in .env.staging
grep GHCR_ORG .env.staging

# Try pulling manually to see the exact error
docker pull ghcr.io/YOUR_ORG/wm_server:latest
```

#### 6. Migrations Not Applied

**Symptoms**:
- Database schema is outdated
- Missing tables or columns

**Solutions**:
```bash
# Check if migrations ran
docker-compose -f docker-compose.staging.yaml logs serverpod | grep -i migration

# Apply migrations manually
docker-compose -f docker-compose.staging.yaml exec serverpod /server --mode staging --apply-migrations

# Check migration files exist
docker-compose -f docker-compose.staging.yaml exec serverpod ls -la /migrations
```

#### 7. High Memory Usage

**Symptoms**:
- Server becomes slow or unresponsive
- Out of memory errors

**Solutions**:
```bash
# Check container resource usage
docker stats

# Set memory limits in docker-compose.staging.yaml
# Add under each service:
# deploy:
#   resources:
#     limits:
#       memory: 512M

# Restart with limits
docker-compose -f docker-compose.staging.yaml up -d
```

### Debugging Commands

Check all container health:
```bash
docker-compose -f docker-compose.staging.yaml ps
```

View real-time logs from all services:
```bash
docker-compose -f docker-compose.staging.yaml logs -f --tail=50
```

Execute shell in a container:
```bash
# Serverpod container (Alpine-based)
docker-compose -f docker-compose.staging.yaml exec serverpod sh

# PostgreSQL container
docker-compose -f docker-compose.staging.yaml exec postgres bash
```

Inspect network:
```bash
docker network inspect serverpod-staging-network
```

---

## Security Considerations

### Environment Variables

- **Never commit** `.env.staging` to version control
- Store sensitive values in a secure vault (e.g., HashiCorp Vault, AWS Secrets Manager)
- Use strong, randomly generated passwords

Generate secure secrets:
```bash
# Generate database password
openssl rand -base64 32

# Generate service secret
openssl rand -base64 32

# Generate Redis password
openssl rand -base64 32
```

### Secrets Handling

Add to `.gitignore`:
```
.env.staging
.env.production
*.pem
*.key
letsencrypt-staging/
letsencrypt/
```

### Network Isolation

The staging environment uses a dedicated Docker network (`serverpod-staging-network`) to isolate services. External access is only through Traefik on ports 80 and 443.

### Database Security

- PostgreSQL is only exposed on localhost (or within Docker network)
- Use SSL/TLS for database connections in production
- Regularly update database passwords
- Restrict database user permissions

### SSL/TLS Configuration

- Let's Encrypt automatically provides SSL certificates
- Certificates are renewed automatically by Traefik
- Ensure your server's firewall allows ports 80 and 443
- Use HTTPS for all public endpoints

### Traefik Dashboard

For production environments, secure the Traefik dashboard:

1. Remove `--api.insecure=true` from Traefik command
2. Add authentication middleware
3. Or disable the dashboard entirely by removing `--api.insecure=true`

### Container Security

- Regularly update Docker images
- Use specific version tags instead of `latest` in production
- Run containers with minimal privileges
- Enable Docker Content Trust for image verification

### Backup Strategy

- Regular database backups (automated via cron)
- Store backups in a secure, off-site location
- Test restore procedures regularly
- Keep multiple backup versions

---

## Additional Resources

### Related Files

- [config/staging.yaml](../wm_server/config/staging.yaml) - Serverpod staging configuration
- [docker-compose.staging.yaml](../wm_server/docker-compose.staging.yaml) - Docker Compose configuration
- [.env.staging.example](../wm_server/.env.staging.example) - Environment variables template

### External Documentation

- [Serverpod Documentation](https://docs.serverpod.dev/)
- [Traefik Documentation](https://doc.traefik.io/traefik/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

### Support

For issues or questions:
1. Check the [Troubleshooting](#troubleshooting) section above
2. Review Serverpod documentation
3. Check Docker Compose logs for error messages
4. Contact your team's DevOps support

---

## Quick Reference

### Start Staging
```bash
cd wm_server
docker-compose -f docker-compose.staging.yaml --env-file .env.staging up -d
```

### View Logs
```bash
docker-compose -f docker-compose.staging.yaml logs -f
```

### Stop Staging
```bash
docker-compose -f docker-compose.staging.yaml down
```

### Rebuild and Deploy
```bash
docker-compose -f docker-compose.staging.yaml pull serverpod
docker-compose -f docker-compose.staging.yaml up -d serverpod
```

### Database Backup
```bash
docker-compose -f docker-compose.staging.yaml exec postgres pg_dump -U postgres wm > backup.sql
```

### Check Status
```bash
docker-compose -f docker-compose.staging.yaml ps
```

---

**Last Updated**: 2026-02-05
**Version**: 1.0.0
