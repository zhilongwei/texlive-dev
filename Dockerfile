FROM ubuntu:latest

# Use noninteractive to avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# 
# 1) Update and install all packages (including curl) in one layer.
# 2) Install cpanminus in the same layer.
# 3) Clean up apt caches/lists within the same layer to reduce final size.
#
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
       apt-utils \
       git \
       procps \
       curl \
       texlive-latex-base \
       texlive-extra-utils \
       texlive-latex-extra \
       biber \
       chktex \
       latexmk \
       make \
       python3-pygments \
       python3-pkg-resources \
       texlive-lang-chinese \
       texlive-lang-japanese \
    && rm -rf /var/lib/apt/lists/*

#
# 4) Install cpanminus and latexindent dependencies.
#    - Combine into one RUN to reduce layers.
#
RUN curl -L http://cpanmin.us | perl - App::cpanminus \
    && cpanm Log::Dispatch::File \
    && cpanm YAML::Tiny \
    && cpanm File::HomeDir \
    && cpanm Unicode::GCString

#
# Optionally: Omit 'apt-get upgrade' to keep image minimal. 
# If you absolutely need the latest packages, you can re-add:
# RUN apt-get update && apt-get -y upgrade && rm -rf /var/lib/apt/lists/*
#

# Restore default frontend and set locale
ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
