# runner-images

Official docker images used by [act_runner](https://gitea.com/gitea/act_runner) to run workflows.

You can find the images on [Docker Hub](https://hub.docker.com/r/gitea/runner-images).

Currently, we have not chosen to build the image ourselves, as [catthehacker/docker_images](https://github.com/catthehacker/docker_images) has done an excellent job of this.
We don't need to reinvent the wheel.

So, we build images from `catthehacker/ubuntu:*` or `node:*`, then install additional packages if needed for act_runner to work.

## Images

We provide three kinds of images, "default", "slim" and "full".

### Default images

Default images are based on `catthehacker/ubuntu:act-*`, and are used by default in act_runner.
They contain most of the tools needed to run workflows and are always recommended if your runner is not disk-space constrained.

| Tag                                 | Base                             | Size                                                                                           | Version                                                                       |
|-------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| `gitea/runner-images:ubuntu-latest` | `catthehacker/ubuntu:act-latest` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-latest?label=size) | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-latest) |
| `gitea/runner-images:ubuntu-22.04`  | `catthehacker/ubuntu:act-22.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-22.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-22.04)  |
| `gitea/runner-images:ubuntu-20.04`  | `catthehacker/ubuntu:act-20.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-20.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-20.04)  |

### Slim images

Slim images are based on `node:20-bookworm`.
They contain Node.js to run basic workflows and set up more development tools if needed.
Their size is much smaller, which is friendly to disk-space constrained runners.

| Tag                                      | Base               | Size                                                                                                | Version                                                                            |
|------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| `gitea/runner-images:ubuntu-latest-slim` | `node:20-bookworm` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-slim-latest?label=size) | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-slim-latest) |
| `gitea/runner-images:ubuntu-22.04-slim`  | `node:20-bookworm` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-slim-22.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-slim-22.04)  |
| `gitea/runner-images:ubuntu-20.04-slim`  | `node:20-bullseye` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-slim-20.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-slim-20.04)  |

### Full images

Full images are based on `catthehacker/ubuntu:full-*`, which contains all tools provided by GitHub Actions runners.
They have huge sizes, but are useful if you need to run workflows in a GitHub Actions compatible environment.

| Tag                                      | Base                              | Size                                                                                                | Version                                                                            |
|------------------------------------------|-----------------------------------|-----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| `gitea/runner-images:ubuntu-latest-full` | `catthehacker/ubuntu:full-latest` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-full-latest?label=size) | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-full-latest) |
| `gitea/runner-images:ubuntu-22.04-full`  | `catthehacker/ubuntu:full-22.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-full-22.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-full-22.04)  |
| `gitea/runner-images:ubuntu-20.04-full`  | `catthehacker/ubuntu:full-20.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-full-20.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-full-20.04)  |
