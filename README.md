# runner-images

Official docker images used by [act_runner](https://gitea.com/gitea/act_runner) to run workflows.

You can find the images on [Docker Hub](https://hub.docker.com/r/gitea/runner-images).

Currently, we have not chosen to build the image ourselves, as [catthehacker/docker_images](https://github.com/catthehacker/docker_images) has done an excellent job of this.
We don't need to reinvent the wheel.

So, we build images from `catthehacker/ubuntu:*` or `node:*`, then install additional packages if needed for act_runner to work.

## Images

We provide two kinds of images, "default" and "slim" (and maybe more like "full" in the future).

### Default images

Default images are based on `catthehacker/ubuntu:*`, and are used by default in act_runner.
They contain most of the tools needed to run workflows and are always recommended if your runner is not disk-space constrained.

| Tag                                 | Base                             | Size                                                                                           |
|-------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------|
| `gitea/runner-images:ubuntu-latest` | `catthehacker/ubuntu:act-latest` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-latest?label=size) |
| `gitea/runner-images:ubuntu-22.04`  | `catthehacker/ubuntu:act-22.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-22.04?label=size)  |
| `gitea/runner-images:ubuntu-20.04`  | `catthehacker/ubuntu:act-20.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-20.04?label=size)  |

### Slim images

Slim images are based on `node:20-bookworm`.
They contain Node.js to run basic workflows and set up more development tools if needed.
Their size is much smaller, which is friendly to disk-space constrained runners.

| Tag                                      | Base               | Size                                                                                                |
|------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------------|
| `gitea/runner-images:ubuntu-latest-slim` | `node:20-bookworm` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-latest-slim?label=size) |
| `gitea/runner-images:ubuntu-22.04-slim`  | `node:20-bookworm` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-22.04-slim?label=size)  |
| `gitea/runner-images:ubuntu-20.04-slim`  | `node:20-bullseye` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-20.04-slim?label=size)  |
