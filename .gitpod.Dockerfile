FROM gitpod/workspace-go:latest

USER gitpod
WORKDIR /home/gitpod

RUN    git clone https://github.com/flutter/flutter.git -b stable \
    && sudo ln -s flutter/bin/flutter /usr/bin/flutter \
    && /usr/bin/flutter upgrade
