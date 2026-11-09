FROM archlinux:latest

ENV TERM=xterm
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo vim git base-devel

RUN useradd -ms /bin/bash testuser && \
  echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

# Gets the linuxtools-term repo
COPY . /home/testuser/archdots
WORKDIR /home/testuser/archdots

# Starts bash for debugging
CMD ["bash"]
