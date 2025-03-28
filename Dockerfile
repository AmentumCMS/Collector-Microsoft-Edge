FROM redhat/ubi${VERSION}
ARG VERSION=8

RUN dnf install https://packages.endpointdev.com/rhel/${VERSION}/main/x86_64/endpoint-repo.noarch.rpm &&\
  dnf install wget &&\
  wget https://packages.endpointdev.com/endpoint-rpmsign-${VERSION}.pub &&\
  rpm --import endpoint-rpmsign-${VERSION}.pub &&\
  dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-${VERSION}.noarch.rpm &&\
  dnf repolist &&\
  dnf download git-all --resolve &&\
  dnf download git-lfs --resolve 