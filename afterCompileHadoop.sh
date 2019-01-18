#!/bin/bash
#VERSION=3.2.0
VERSION=3.3.0-SNAPSHOT
source env-${VERSION}.sh
#enable remote debug
source set_remote_debug_env.sh
#yarn-daemon.sh stop resourcemanager
#yarn-daemon.sh stop nodemanager
yarn --loglevel DEBUG --daemon stop resourcemanager
yarn --loglevel DEBUG --daemon stop nodemanager
> ../logs/yarn/hadoop-yarn-nodemanager-master0-VirtualBox.log
> ../logs/yarn/hadoop-yarn-resourcemanager-master0-VirtualBox.log
#stop-yarn.sh
sleep 1
sudo mkdir /opt/code/hadoop/hadoop-dist/target/hadoop-${VERSION}/logs
sudo chown -R root:hadoop /opt/code/hadoop/hadoop-dist
sudo chmod g+w /opt/code/hadoop/hadoop-dist/target/hadoop-${VERSION}/logs
sudo chown -R yarn:hadoop /opt/code/hadoop/hadoop-dist/target/hadoop-${VERSION}/logs
sudo chown root:hadoop ../home_${VERSION}/bin/container-executor
sudo cp conf_${VERSION}/container-executor.cfg ../home_${VERSION}/etc/hadoop/
sudo chown root:hadoop ../home_${VERSION}/etc/hadoop/container-executor.cfg
sudo chmod 6050 ../home_${VERSION}/bin/container-executor
sudo chmod 0400 ../home_${VERSION}/etc/hadoop/container-executor.cfg

#put some vendor plugin
#./copy_device_plugins.sh
#start-yarn.sh
yarn --loglevel DEBUG --daemon start resourcemanager
yarn --loglevel DEBUG  --daemon start nodemanager
#yarn-daemon.sh --loglevel DEBUG start resourcemanager
#yarn-daemon.sh --loglevel DEBUG start nodemanager
