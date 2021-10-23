# In this template, we'll use the development tag for our
# starter-pack image. We'll provide stable and beta tags soon.
FROM ghcr.io/code-server-boilerplates/starter-pack:develop

# Add image labels here, but read comments as you edit
# Replace code-server-boilerplates with username-here/repo
LABEL org.opencontainers.image.source="https://github.com/code-server-boilerplates/starter-pack-as-base-image" \
      org.opencontainers.image.vendor="code-server Community" \
      org.opencontainers.image.documentation="https://csb-docs.community-lores.gq"

# prefix for thr entrypoint logs, in which you should update into
# @namespace/template-slug
ENV TEMPLATE_SLUG_PREFIX="@code-server-boilerplates/nodejs-starter" \
    # Hard-code Node.js version, but we automate upgrades through Autofix npm package.
    NODE_VERSION=14.18.1

# Copy our custom files from our source files
COPY --chown=coder:coder toolkits/packages/scripts /home/coder/.local/bin
COPY --chown=coder:coder toolkits/packages/dotbashrcdir /home/coder/.bashrc.d

RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | PROFILE=/dev/null bash \
    && bash -c ". .nvm/nvm.sh \
        && nvm install $NODE_VERSION --latest-npm"

# Source: https://github.com/gitpod-io/workspace-images/blob/master/full/Dockerfile#L145
RUN .local/bin/global-npm-install typescript yarn node-gyp

# PaaS toolkits
RUN .local/bin/global-npm-install @railway/cli vercel heroku

# Linters and formatters
RUN .local/bin/global-npm-install \
    # The main packages
    eslint prettier \
    # Type definations for TS users
    @types/prettier \
    # Eslint and Prettier plugins
    eslint-config-prettier eslint-plugin-import express-prettier stylelint-config-prettier prettier-eslint

# Maintainer tools
RUN .local/bin/global-npm-install commitizen cz-conventional-changelog @commitlint/cli

# Miscellenous
RUN .local/bin/global-npm-install npkill @vercel/ncc release