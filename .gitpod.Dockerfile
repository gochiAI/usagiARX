FROM gitpod/workspace-go:latest

USER gitpod
WORKDIR /home/gitpod

RUN git clone https://github.com/flutter/flutter.git -b stable
RUN sudo ln -s /home/gitpod/flutter/bin/flutter /usr/bin/flutter
RUN /usr/bin/flutter upgrade
RUN /usr/bin/flutter precache
