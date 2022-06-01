# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
FROM mcr.microsoft.com/vscode/devcontainers/php:7

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install 14 2>&1"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

COPY ./scripts/*.sh /temp/scripts/
COPY ./configs/*.conf /temp/configs/

RUN chmod -x /temp/ && bash /temp/scripts/opencart.sh \
                    && bash /temp/scripts/aliases.sh \
                    && rm -rf /temp/
