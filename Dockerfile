FROM alpine:latest
ARG USER=default
ENV HOME /home/$USER

RUN apk add bash 
RUN apk add --update sudo
RUN adduser -D $USER \
        && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
        && chmod 0440 /etc/sudoers.d/$USER
USER $user
CMD echo "User $(whoami) running from $PWD with premissions: $(sudo -l)"
ADD dummy.txt .
