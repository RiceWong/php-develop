#! /bin/sh
export PYTHONPATH=\${PYTHONPATH}:/usr/local/dbgp/pythonlib
nohup /usr/local/dbgp/pydbgpproxy -i 0.0.0.0:10001 -d 127.0.0.1:10000  > /var/log/dbgp.log 2>&1