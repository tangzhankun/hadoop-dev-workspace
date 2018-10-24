#!/bin/bash
stop-yarn.sh
sleep 1
sudo mkdir /opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/logs
sudo chown -R root:hadoop /opt/code/hadoop/hadoop-dist
sudo chmod g+w /opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/logs
sudo chown -R yarn:hadoop /opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/logs
sudo chown root:hadoop home/bin/container-executor
sudo cp conf/container-executor.cfg home/etc/hadoop/
sudo chown root:hadoop home/etc/hadoop/container-executor.cfg
sudo chmod 6050 home/bin/container-executor
sudo chmod 0400 home/etc/hadoop/container-executor.cfg

#put some vendor plugin
sudo cp ve-1.0-SNAPSHOT.jar home/share/hadoop/yarn/
start-yarn.sh
