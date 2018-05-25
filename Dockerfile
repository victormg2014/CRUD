FROM ubuntu:16.04

RUN sh -c "echo deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted > /etc/apt/sources.list.d/docker.list"
RUN apt-get update && apt-get install -y openssh-server && apt-get install -y python
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN mkdir /root/.ssh && chmod 700 /root/.ssh

ADD id_rsa.pub /root/.ssh/authorized_keys

RUN chmod 400 /root/.ssh/authorized_keys && chown root:root /root/.ssh/* && chmod 600 /root/.ssh/*

RUN apt-get install -y python-six

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

