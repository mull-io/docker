# AGENTS.md

This file contains guidelines and commands for agentic coding agents working in this müll.io Docker repository.

## Project Overview

This is a Docker-based web service for müll.io (waste collection information). It uses:
- Apache HTTPD 2.4 (Alpine Linux)
- Shell CGI scripts
- Environment variable configuration
- JSON API output

## Build Commands

### Docker Commands
```bash
# Build the Docker image
docker build --no-cache -t muell-io .

# Run the container with environment variables
docker run --rm -it \
    --name muell-io \
    -e MUELL_STREET="Schürhornweg" \
    -e MUELL_HOUSE_NUMBER="1" \
    -e MUELL_ZIP="33649" \
    -e MUELL_CITY="Bielefeld" \
    -e MUELL_COUNTRY="DE" \
    -p 8080:80 muell-io

# Test the API endpoint
curl http://localhost:8080/
```

### Development Commands
```bash
# Test CGI script locally (requires setting env vars first)
export MUELL_STREET="Test Street"
export MUELL_HOUSE_NUMBER="123"
./cgi-bin/output.cgi

# Validate Apache configuration
docker run --rm muell-io apachectl configtest
```

## Code Style Guidelines

### Shell Scripts (CGI)
- Use `#!/bin/sh` shebang for POSIX compatibility
- Use double quotes for variable expansion: `echo "$VAR"`
- Use `echo` for output, avoid `printf` unless necessary
- JSON output must be properly escaped
- Always set Content-Type header for CGI responses
- Use environment variables for configuration (MUELL_* prefix)

### Apache Configuration
- Follow existing httpd.conf structure
- Use standard Apache module loading pattern
- Pass environment variables using `PassEnv` directive
- Maintain security: `Require all granted` only for necessary directories
- Keep CGI directory permissions minimal: `Options None`

### Dockerfile
- Use specific image tags: `httpd:2.4-alpine`
- COPY commands in order: cgi-bin, conf, htdocs
- Use RUN for permission changes only
- EXPOSE port 80 (standard HTTP)
- No CMD instruction - use base image default

### File Structure
```
/
├── cgi-bin/          # CGI scripts (executable)
├── conf/             # Apache configuration
├── htdocs/           # Static web files
├── Dockerfile        # Container build
└── README.md         # Documentation
```

## Naming Conventions

### Environment Variables
- Prefix: `MUELL_`
- Format: `UPPER_SNAKE_CASE`
- Examples: `MUELL_STREET`, `MUELL_HOUSE_NUMBER`, `MUELL_ZIP`

### Files
- CGI scripts: lowercase with `.cgi` extension
- Config files: lowercase with appropriate extension
- Use hyphens in README section headers

### JSON Output
- Use camelCase for JSON keys
- Include timestamp: `date` field
- String values only (no numbers in JSON)

## Error Handling

### CGI Scripts
- Always output Content-Type header first
- Use HTTP status codes via echo (if needed)
- Validate environment variables before use
- Graceful fallbacks for missing data

### Docker
- Use `--no-cache` flag for reproducible builds
- Clean container lifecycle with `--rm` flag
- Proper error messages in build logs

## Testing

### Manual Testing
1. Build image: `docker build --no-cache -t muell-io .`
2. Run with test environment variables
3. Access endpoint: `http://localhost:8080`
4. Verify JSON structure and content

### Test Environment Variables
```bash
MUELL_STREET="Test Street"
MUELL_HOUSE_NUMBER="123"
MUELL_ZIP="12345"
MUELL_CITY="Test City"
MUELL_COUNTRY="DE"
```

## Security Considerations

- CGI scripts run as www-data user
- No sensitive data in container image
- Environment variables contain address data only
- Apache directory restrictions in place
- No shell command injection risks (simple echo only)

## Common Tasks

### Adding New Environment Variables
1. Add to Docker run command
2. Add to Apache httpd.conf: `PassEnv VAR_NAME`
3. Use in CGI script: `echo "$VAR_NAME"`
4. Update README.md documentation

### Modifying CGI Output
- Edit `cgi-bin/output.cgi`
- Test locally with exported environment variables
- Rebuild Docker image
- Verify JSON structure

### Apache Configuration Changes
- Edit `conf/httpd.conf`
- Test with `apachectl configtest`
- Rebuild Docker image
- Verify container starts correctly

## Dependencies

- Docker Engine
- Apache HTTPD 2.4 (in container)
- Shell environment (sh)
- No external package managers needed