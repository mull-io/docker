# müll.io - docker

> NOTE. Currently only a dummy integration! This is not usable at the moment.

Ready to use docker container to get müll.io information via müll.io CLI. Just set the address information as ENV
variables and use the `/` route to get the information.

## Build the image

### Option 1: Build locally
```bash
docker build --no-cache -t muell-io .
```

### Option 2: Pull from GitHub Packages
```bash
# Pull the latest version
docker pull ghcr.io/mull-io/docker:latest

# Or pull a specific version
docker pull ghcr.io/mull-io/docker:v1.0.0
```

## Run the image

```bash
docker run --rm -it \
    --name muell-io \
    -e MUELL_STREET="Schürhornweg" \
    -e MUELL_HOUSE_NUMBER="1" \
    -e MUELL_ZIP="33649" \
    -e MUELL_CITY="Bielefeld" \
    -e MUELL_COUNTRY="DE" \
    -p 8080:80 muell-io
```

### Using GitHub Packages image
```bash
docker run --rm -it \
    --name muell-io \
    -e MUELL_STREET="Schürhornweg" \
    -e MUELL_HOUSE_NUMBER="1" \
    -e MUELL_ZIP="33649" \
    -e MUELL_CITY="Bielefeld" \
    -e MUELL_COUNTRY="DE" \
    -p 8080:80 ghcr.io/mull-io/docker:latest
```

## Env Variables

| Name               | Example value |
|--------------------|---------------|
| MUELL_STREET       | Schürhornweg  |
| MUELL_HOUSE_NUMBER | 1             |
| MUELL_ZIP          | 33649         |
| MUELL_CITY         | Bielefeld     |
| MUELL_COUNTRY      | DE            |

Call http://localhost:8080/

## GitHub Actions

This project uses GitHub Actions to automatically build and publish Docker images to GitHub Packages when a release is created.

### Workflow Features
- ✅ Triggers on release publication
- ✅ Multi-platform support (linux/amd64, linux/arm64)
- ✅ Semantic versioning tags
- ✅ Automatic metadata generation
- ✅ GitHub Container Registry integration

### Manual Release Process
1. Create a new release on GitHub
2. Tag the release (e.g., `v1.0.0`)
3. The workflow automatically builds and publishes the Docker image
4. Image is available at `ghcr.io/mull-io/docker:[TAG]`
