# Docker Practice Repository

This repo is my hands-on Docker practice workspace.

## What I practiced

- Built and containerized a Go web server.
- Mapped container ports to host ports.
- Tagged and pushed images to Docker Hub.
- Pulled/reran containers from pushed images.
- Practiced troubleshooting common Docker errors (port already allocated, image in use by container).
- Built a separate Python-based image as an additional exercise.

## Repository structure (practice-focused)

- `main.go` - Go HTTP server (serves a simple HTML page).
- `dockerfile` - Dockerfile used for the Go server image.
- `DockerBasic.git` - compiled Go binary copied into the image.
- `main.py` - Python script for text analysis practice.
- `Dockerfile.py` - Dockerfile for Python image-building practice.
- `books/frankenstein.txt` - input file for the Python script.
- `.env` - environment variable examples.

## Go Docker practice workflow

### 1) Build Go binary

```bash
go build -o DockerBasic.git main.go
```

### 2) Build Docker image

```bash
docker build -t anikbarua007/goserver:0.2.0 -f dockerfile .
```

### 3) Run container

```bash
docker run -d --name goserver_020 -p 8991:8991 anikbarua007/goserver:0.2.0
```

Open in browser:

- http://localhost:8991

> Note: `main.go` now defaults to port `8991` if `PORT` is not set.

### 4) Push image to Docker Hub

```bash
docker push anikbarua007/goserver:0.2.0
```

### 5) Pull and run from Docker Hub

```bash
docker pull anikbarua007/goserver:0.2.0
docker run -p 8991:8991 anikbarua007/goserver:0.2.0
```

## Useful troubleshooting commands I used

### Port already allocated

```bash
docker ps
docker rm -f <container_id>
```

Then rerun container.

### Cannot delete image because container is using it

```bash
docker rm -f <container_id>
docker image rm anikbarua007/goserver:0.2.0
```

Or force remove:

```bash
docker image rm -f anikbarua007/goserver:0.2.0
```

## Python Docker practice (extra)

`Dockerfile.py` is an additional practice Dockerfile that:

- installs build dependencies,
- builds Python 3.10.8 from source,
- copies `main.py` and `books/`,
- runs the script with `python3.10 main.py`.

---

Practice objective: learn Docker image build/run/push/pull lifecycle and container debugging through a small reproducible project.
