#/bin/bash
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
dnf install -y https://packages.endpointdev.com/rhel/9/main/x96_64/endpoint-repo.noarch.rpm
dnf install -y wget dnf-utils
wget https://packages.endpointdev.com/endpoint-rpmsign-9.pub
rpm --import endpoint-rpmsign-9.pub
repotrack --destdir git-rpm git-all
createrepo git-rpm
dnf download git-all --resolve
dnf download git git-lfs --resolve
dnf install --downloadonly --installroot=/var/tmp/git-installroot --downloaddir=/var/tmp/git git