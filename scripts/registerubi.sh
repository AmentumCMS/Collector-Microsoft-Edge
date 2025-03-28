#!/bin/bash
VERSION=$(grep -oP '(?<=VERSION_ID=")[^.]+' /etc/os-release)
export PATH=$PATH:$PWD/scripts
rm -v /etc/rhsm-host /etc/yum.repos.d/ubi.repo
subscription-manager register --username ${1} --password ${2}
echo "Installing Software"
dnf install -y dnf-plugins-core yum-utils xorriso isomd5sum tree procps-ng ncurses pigz
# echo "Registering Microsoft Repo"
# dnf install -y https://packages.microsoft.com/config/rhel/${VERSION}/packages-microsoft-prod.rpm
# sed -i 's/packages-microsoft-com-prod/microsoft-prod/g' /etc/yum.repos.d/microsoft-prod.repo
echo "Registering Microsoft Edge Repo"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
mv /etc/yum.repos.d/packages.microsoft.com_yumrepos_edge.repo /etc/yum.repos.d/microsoft-edge.repo
sed -i 's/packages.microsoft.com_yumrepos_edge/microsoft-edge/g' /etc/yum.repos.d/microsoft-edge.repo
echo -e "\nAvailable Repositories:\n$(dnf repolist)\n"