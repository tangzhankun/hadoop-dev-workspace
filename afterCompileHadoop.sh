#!/bin/bash
source env.sh
#reset writable hadoop dir
cp ../../ve-1.0-SNAPSHOT.jar ../home/share/hadoop/yarn/
#for ssh
sudo chown -R NW0021:NW0021 ~/.ssh
sudo chmod 755 /home/NW0021
sudo chmod 755 /home/NW0021/.ssh
cd ~/.ssh
sudo chmod 644 id_rsa.pub known_hosts
sudo chmod 600 authorized_keys id_rsa
cd -
yarn --daemon stop resourcemanager
yarn --loglevel DEBUG --daemon stop nodemanager
#stop-yarn.sh
sleep 1
mkdir ${HADOOP_COMMON_HOME}/logs
chmod g+w ${HADOOP_COMMON_HOME}/logs
chown -R NW0021:NW0021 ${HADOOP_COMMON_HOME}/logs
sudo chown root:NW0021 ../home/bin/container-executor
cp conf/container-executor.cfg ../home/etc/hadoop/

sudo chown root ../home/etc/hadoop
sudo chown root ../home/etc
sudo chown root /home/NW0021/hadoop-3.3.0-SNAPSHOT

sudo chown root:NW0021 ../home/etc/hadoop/container-executor.cfg
sudo chmod 6050 ../home/bin/container-executor
sudo chmod 0400 ../home/etc/hadoop/container-executor.cfg

sudo chmod 755 /home/NW0021/hadoop-3.3.0-SNAPSHOT/etc/hadoop
sudo chmod 755 /home/NW0021/hadoop-3.3.0-SNAPSHOT/etc
sudo chmod 755 /home/NW0021/hadoop-3.3.0-SNAPSHOT
#put some vendor plugin
#./copy_device_plugins.sh
#start-yarn.sh
yarn --daemon start resourcemanager
yarn --loglevel DEBUG --daemon start nodemanager
