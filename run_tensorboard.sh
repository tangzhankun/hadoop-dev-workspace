#!/bin/bash
hdfs dfs -rm -r .yarn/services/tf-job-001
hdfs dfs -rm -R -f submarine/jobs/tf-job-001
SUBMARINE_VERSION=0.2.0
CLASSPATH=`/opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT/bin/hadoop classpath --glob`:/home/yarn/submarine-release/0.2.0/hadoop-submarine-dist-0.2.0-hadoop-3.1/hadoop-submarine-core-${SUBMARINE_VERSION}.jar:/home/yarn/submarine-release/0.2.0/hadoop-submarine-dist-0.2.0-hadoop-3.1/hadoop-submarine-yarnservice-runtime-${SUBMARINE_VERSION}.jar \
java org.apache.hadoop.yarn.submarine.client.cli.Cli job run \
  -verbose \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.1.2 \
  --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow:demo \
  --tensorboard \
  --worker_resources memory=2G,vcores=2 \
  --worker_launch_cmd "cd /cifar10_estimator && python cifar10_main.py --data-dir=%input_path% --job-dir=%checkpoint_path% --num-gpus=0 --train-steps=2"

# for test purpose
#  --worker_launch_cmd "cat /proc/1/cgroup"
# --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
#  --checkpoint_path hdfs://default/user/yarn/submarine/jobs/tf-job-001/staging \
#  --input_path hdfs://default/user/yarn/cifar-10-data  \
#  -keep_staging_dir \
#  --tensorboard \
#  --quicklink notebook_ui="https://master-0:7070" \
