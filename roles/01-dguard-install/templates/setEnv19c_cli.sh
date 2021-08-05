# Oracle Settings
export TMP=/tmp
export TMPDIR=$TMP
export ORACLE_BASE=/opt/oracle
export ORACLE_HOME=$ORACLE_BASE/instantclient_19_10
export LD_LIBRARY_PATH=$ORACLE_HOME:/lib:/usr/lib
export ANSIBLE_CONFIG=/home/ansible/BNP_POC_DGuard/ansible_cfg/ansible.cfg
export TNS_ADMIN=$ORACLE_HOME/network/admin
export PATH=$ORACLE_HOME:/usr/sbin:/usr/local/bin:$PATH
