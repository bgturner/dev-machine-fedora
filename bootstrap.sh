#! /bin/bash
#
# Note: Fedora 24 ships with `dnf` instead of `yum`, but we are installing
# yum in order to avoid errors while using roles from Ansible Galaxy.
#

echo ""
echo "Updating existing packages..."
sudo dnf upgrade

echo ""
echo "Installing base packages to work with Ansible on Fedora..."
sudo dnf install ansible python2-dnf yum

echo ""
echo "Installing roles from Ansible Galaxy..."
ansible-galaxy install -r ./requirements.yml

echo ""
echo "Provisioning local machine using Ansible..."
ansible-playbook -i inventory/local -s -K playbook.yml

