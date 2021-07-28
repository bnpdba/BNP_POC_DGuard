# DataGuard with dg-broker on a 2-node Primary/Standby setup with Oracle 19c/Redhat 7.9
Centralised playbooks,includes,roles,templates,etc... for easing the setup of a DataGuard-Setup

In the repo,there are currenly 2 .yaml ansible-playbooks ( oraswdb-install_19c.yaml & dataguard_prepare_19c.yaml)

In the repo,there are different *.xml.j2 files which are json-templates used in yaml-playbooks

In the repo,there is 1 ansible-inventory (alias /etc/ansible/hosts) that should be located under:
==> /home/ansible/BNP/ORAPROV_ANSIBLE/inventory/poc/hosts
This file is a etc-host-like file to give each host a special group/role within ansible
The active inventory is listed below and acts as the one used for a DataGuard-POC with Oracle 19c on RedHat Linux 7.9

In the repo,there is 1 ansible-config file that should be located under:
==> /home/ansible/BNP/ANSIBLE_CFG/ansible.cfg


#ansible-inventory
=
/home/ansible/BNP/ORAPROV_ANSIBLE/inventory/poc/hosts
=
PS: All mentioned hostnames below are only "fictive" names just for demo & poc purposes !!

[all]
pred09
ctlpoc60
orapoc01
orapoc02

[controller]
ctlpoc60

[oranodes]
orapoc01
orapoc02

[primnodes]
orapoc01 dbname=POC19 ansible_host=192.168.0.61 ansible_hostname=orapoc01 node=orapoc01

[stbynodes]
orapoc02 dbname=DPOC19 ansible_host=192.168.0.64 ansible_hostname=orapoc02 node=orapoc02

[linuxnodes]
pred09
ctlpoc60
orapoc01
orapoc02

ansible-config file
=
The above hosts file is referenced in another ansible-type of file (Configuration File , see below and part of this dguard-repo)

/home/ansible/BNP/ANSIBLE_CFG/ansible.cfg
=
[defaults]
retry_files_enabled=False
retry_files_save_path = "/tmp"
allow_world_readable_tmpfiles=true
error_on_undefined_vars = True

library=/home/ansible/BNP/ORAPROV_ANSIBLE/roles/10-Install_Uninstall/library
inventory=/home/ansible/BNP/ORAPROV_ANSIBLE/inventory/poc/hosts

localhost_warning=false
localhost ansible_connection=local ansible_python_interpreter="/usr/bin/env python"

remote_tmp     = ~/.ansible/tmp
local_tmp      = ~/.ansible/tmp
forks          = 5
poll_interval  = 15
ask_sudo_pass  = False
ask_pass       = False
transport     = smart
remote_port    = 22
deprecation_warnings=False
command_warnings=False

ansible_connection=ssh
ansible_user=root
ansible_sudo=true
ansible_become=true
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
host_key_checking = False
host_key_check = False

# Use the stdout_callback when running ad-hoc commands.
# Use the YAML callback plugin.
stdout_callback = yaml
bin_ansible_callbacks = True
callback_whitelist = profile_tasks

[ssh_connection]
# ssh arguments to use
ssh_args = -o StrictHostKeyChecking=no
scp_if_ssh = smart




