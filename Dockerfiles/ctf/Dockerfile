## Inspired by LiveOverflow (pwn_docker_example) ##
# docker build -t ctf:ubuntu19.10 .
# docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash

FROM ubuntu:20.04
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -d /home/ctf/ -m -p ctf -s /bin/bash ctf
RUN echo "ctf:ctf" | chpasswd

WORKDIR /home/ctf

# Apt Installs
RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386 && \
	pip3 install ropper 
# Pwntools
RUN python3 -m pip install --upgrade pwntools && \
	apt-get install binutils-$ARCH-linux-gnu
# PwnDBG
RUN	cd /usr/bin && \
	git clone https://github.com/pwndbg/pwndbg && \
	cd pwndbg && \
	./setup.sh && \
	cp ~/.gdbinit /home/ctf/.gdbinit && \
	chown ctf:ctf /home/ctf/.gdbinit

USER ctf
