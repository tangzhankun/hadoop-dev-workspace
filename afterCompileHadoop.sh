#!/bin/bash
> ../apache-hadoop-install-dir/logs/yarn/hadoop-yarn-nodemanager-zhankun-VirtualBox.log
source env.sh
yarn --daemon stop resourcemanager
yarn --loglevel DEBUG --daemon stop nodemanager
#stop-yarn.sh
sleep 1
sudo mkdir /opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/logs
sudo chown -R root:hadoop /opt/code/hadoop/hadoop-dist
sudo chmod g+w /opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/logs
sudo chown -R yarn:hadoop /opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/logs
sudo chown root:hadoop ../apache-hadoop-install-dir/home/bin/container-executor
sudo cp conf/container-executor.cfg ../apache-hadoop-install-dir/home/etc/hadoop/
sudo chown root:hadoop ../apache-hadoop-install-dir/home/etc/hadoop/container-executor.cfg
sudo chmod 6050 ../apache-hadoop-install-dir/home/bin/container-executor
sudo chmod 0400 ../apache-hadoop-install-dir/home/etc/hadoop/container-executor.cfg

#put some vendor plugin
#./copy_device_plugins.sh
#start-yarn.sh
yarn --daemon start resourcemanager
yarn --loglevel DEBUG --daemon start nodemanager
