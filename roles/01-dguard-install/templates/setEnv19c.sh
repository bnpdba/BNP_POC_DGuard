# Oracle Settings
export TMP=/tmp
export TMPDIR=$TMP

export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export ORACLE_BASE=/opt/oracle
export ORACLE_SID=POC19
export ORA_INVENTORY=$ORACLE_BASE/oraInventory
export DATA_DIR=/oradata/POC19

export PATH=/usr/sbin:/usr/local/bin:$PATH
export PATH=$ORACLE_HOME/bin:$PATH

export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib
