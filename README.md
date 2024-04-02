# Runner Images

![docker pulls](https://img.shields.io/docker/pulls/gitea/runner-images?logo=docker&label=pulls)
![docker stars](https://img.shields.io/docker/stars/gitea/runner-images?logo=docker&label=stars)

Official docker images used by [act_runner](https://gitea.com/gitea/act_runner) to run workflows.

You can find the images on [gitea/runner-images](https://hub.docker.com/r/gitea/runner-images).

Currently, we have not chosen to build the image ourselves, as [catthehacker/docker_images](https://github.com/catthehacker/docker_images) has done an excellent job of this.
We don't need to reinvent the wheel.

Images are built from `catthehacker/ubuntu:*` or `node:*`.
Additional packages will be installed if they are needed by `act_runner`.

## Images

Here are three types of images: "default", "slim", and "full".

### Default images

Default images are based on `catthehacker/ubuntu:act-*`, and are used by default in act_runner.
They contain most of the tools needed to run workflows and are always recommended if your runner is not disk-space constrained.

| Tag                                                                                                  | Base                             | Size                                                                                           | Version                                                                       |
|------------------------------------------------------------------------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| [ubuntu-latest](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-latest&ordering=-name) | `catthehacker/ubuntu:act-latest` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-latest?label=size) | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-latest) |
| [ubuntu-22.04](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-22.04&ordering=-name)   | `catthehacker/ubuntu:act-22.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-22.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-22.04)  |
| [ubuntu-20.04](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-20.04&ordering=-name)   | `catthehacker/ubuntu:act-20.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-20.04?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-20.04)  |

### Slim images

Slim images are based on `node:20-*-slim`.
They contain Node.js to run basic workflows and set up more development tools if needed.
Their size is much smaller, which is friendly to disk-space constrained runners.

| Tag                                                                                                            | Base                    | Size                                                                                                | Version                                                                            |
|----------------------------------------------------------------------------------------------------------------|-------------------------|-----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| [ubuntu-latest-slim](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-latest-slim&ordering=-name) | `node:20-bookworm-slim` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-latest-slim?label=size) | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-latest-slim) |
| [ubuntu-22.04-slim](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-22.04-slim&ordering=-name)   | `node:20-bookworm-slim` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-22.04-slim?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-22.04-slim)  |
| [ubuntu-20.04-slim](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-20.04-slim&ordering=-name)   | `node:20-bullseye-slim` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-20.04-slim?label=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-20.04-slim)  |

### Full images

Full images are based on `catthehacker/ubuntu:full-*`, which contains all tools provided by GitHub Actions runners.
They have huge sizes, but are useful if you need to run workflows in a GitHub Actions compatible environment.
Please note that full images support amd64 architecture only.

| Tag                                                                                                            | Base                              | Size                                                                                                     | Version                                                                            |
|----------------------------------------------------------------------------------------------------------------|-----------------------------------|----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| [ubuntu-latest-full](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-latest-full&ordering=-name) | `catthehacker/ubuntu:full-latest` | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-latest-full?label-full=size) | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-latest-full) |
| [ubuntu-22.04-full](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-22.04-full&ordering=-name)   | `catthehacker/ubuntu:full-22.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-22.04-full?label-full=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-22.04-full)  |
| [ubuntu-20.04-full](https://hub.docker.com/r/gitea/runner-images/tags?name=ubuntu-20.04-full&ordering=-name)   | `catthehacker/ubuntu:full-20.04`  | ![size](https://img.shields.io/docker/image-size/gitea/runner-images/ubuntu-20.04-full?label-full=size)  | ![version](https://img.shields.io/docker/v/gitea/runner-images/ubuntu-20.04-full)  |

## Migration

If you have already installed a runner which uses `node:16-*` or `node:20-*` as default images, you can migrate to the new images by following the steps:

1. Ensure your Gitea's version is v1.21.0 or later.
2. Ensure your act_runner's version is v0.2.9 or later.
3. Update your runner's configuration file like `config.yaml`:
   ```yaml
   # ...
   
   runner:
     # ...
     labels:
       - "ubuntu-latest:docker://gitea/runner-images:ubuntu-latest"
       - "ubuntu-22.04:docker://gitea/runner-images:ubuntu-22.04"
       - "ubuntu-20.04:docker://gitea/runner-images:ubuntu-20.04"
   
   container:
     # ...
     force_pull: true
   
   # ...
   ```
4. Restart your runner.
