ARG BASE_IMAGE_TAG

FROM ghcr.io/catthehacker/ubuntu:${BASE_IMAGE_TAG}

ARG IMAGE_CREATED
ARG IMAGE_VERSION
ARG IMAGE_REVISION

LABEL org.opencontainers.image.created="${IMAGE_CREATED}" \
      org.opencontainers.image.authors="Gitea" \
      org.opencontainers.image.url="https://gitea.com/gitea/runner-images" \
      org.opencontainers.image.documentation="https://gitea.com/gitea/runner-images/src/branch/main/README.md" \
      org.opencontainers.image.source="https://gitea.com/gitea/runner-images" \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      org.opencontainers.image.revision="${IMAGE_REVISION}" \
      org.opencontainers.image.vendor="Gitea" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="Official Gitea Actions runner images" \
      org.opencontainers.image.description="Official docker images used by act_runner to run workflows."
