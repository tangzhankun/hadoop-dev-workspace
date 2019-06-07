#!/bin/bash
hdfs dfs -rm -r .yarn/services/tf-job-001
YARN_LIB=/opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/share/hadoop/yarn/
sudo cp /home/yarn/submarine-release/0.2.0/hadoop-submarine-dist-0.2.0-hadoop-3.1/hadoop-submarine-core-0.2.0.jar $YARN_LIB
sudo cp /home/yarn/submarine-release/0.2.0/hadoop-submarine-dist-0.2.0-hadoop-3.1/hadoop-submarine-yarnservice-runtime-0.2.0.jar $YARN_LIB
yarn jar $YARN_LIB/hadoop-submarine-core-0.2.0.jar job run \
  -verbose \
  -wait_job_finish \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.1.2 \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow:demo \
  --input_path hdfs://default/user/yarn/cifar-10-data  \
  --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
  --worker_resources memory=2G,vcores=1  \
  --worker_launch_cmd "cd /cifar10_estimator && python cifar10_main.py --data-dir=%input_path% --job-dir=%checkpoint_path% --num-gpus=0 --train-steps=2"

sudo rm $YARN_LIB/hadoop-submarine-core-0.2.0.jar
sudo rm $YARN_LIB/hadoop-submarine-yarnservice-runtime-0.2.0.jar
# for test purpose
#  --worker_launch_cmd "cat /proc/1/cgroup"
