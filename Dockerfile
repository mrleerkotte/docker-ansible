FROM alpine:3

LABEL maintainer="Marlon Leerkotte <marlon@leerkotte.net>"

ENV ANSIBLE_UID=51340 \
    ANSIBLE_GID=51340

RUN apk add --no-cache openssh-client shadow ansible \
    && groupadd --gid $ANSIBLE_GID --system ansible \
    && useradd --uid $ANSIBLE_UID --gid $ANSIBLE_GID --system --create-home ansible

WORKDIR /home/ansible

USER ansible

CMD ["sh"]
