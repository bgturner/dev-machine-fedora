# Provisioning a Fedora Laptop for development

## Summary

This is a collection of Ansible playbooks to provision a Fedora laptop for development. Here are the main steps to get started:

* Clone this repo
* Install any updates to existing software
* Install Ansible and dependencies
* Install 'vendor' roles from Ansible Galaxy
* Run Ansible to provision the laptop

So from a vanilla install of Fedora, the above would look like:

```
git clone https://github.com/bgturner/dev-machine-fedora ~/.dev-machine && cd ~/.dev-machine
sudo dnf upgrade
sudo dnf install ansible python2-dnf yum
ansible-galaxy install -r ./requirements.yml
ansible-playbook -i inventory/local -s -K playbook.yml
```

or just use this repo's `bootstrap.sh` file:

```
git clone https://github.com/bgturner/dev-machine-fedora ~/.dev-machine && cd ~/.dev-machine
./bootstrap.sh
```

## Adjustments

This repo is meant for me to provision a laptop as well as track my dev machine's configuration in git. As such, you probably will want to only use this for reference in your fork.

To adjust the variables for this repo, see `vars/main.yml`. To adjust the actual roles that are are run and hence the software that is installed, see the`roles/common/tasks/main.yml` file.

## Differences from Typical Ansible repos

Ansible is often used for provisioning servers, and as such, Ansible is typically installed on some machine (your laptop, a coordinating server, etc) and then runs it's playbooks on an inventory of *other* hosts. This is great because it means that no additional software for provisioning needs to be installed on the machines being provisioned.

But this repo is meant for a laptop. So how do we use Ansible to provision the target host when that target is itself? We simply act upon the *inventory* of `localhost`!

