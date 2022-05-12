FROM gitpod/workspace-base:latest

USER gitpod

RUN git clone https://github.com/flutter/flutter.git -b stable
