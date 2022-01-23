FROM rockylinux:8.5
RUN groupadd -r postgres && useradd --no-log-init -r -g postgres postgres &&   \
    dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-`uname -p`/pgdg-redhat-repo-latest.noarch.rpm && \
    dnf -qy module disable postgresql && \
    dnf install -y pgbackrest 

USER postgres
ENTRYPOINT ["pgbackrest"]
CMD ["help"]
