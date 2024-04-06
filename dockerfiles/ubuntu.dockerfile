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

# TODO: automate architecture detection
RUN teacpuarchitecture="linux-amd64" 
RUN tealatestreleasepage="https://gitea.com/api/v1/repos/gitea/tea/releases?draft=false&pre-release=false&limit=5"
RUN tealatestversion=$(curl --silent ${tealatestreleasepage} | jq -r '.[0].tag_name' 2>&1 | sed -e 's|.*-||' -e 's|^v||')

RUN wget -O /usr/local/bin/tea https://dl.gitea.io/tea/${tealatestversion}/tea-${tealatestversion}-${teacpuarchitecture}
RUN chmod +x /usr/local/bin/tea