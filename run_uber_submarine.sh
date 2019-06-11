#!/bin/bash
hdfs dfs -rm -r .yarn/services/tf-job-001
hdfs dfs -rm -R -f submarine/jobs/tf-job-001
CLASSPATH=/home/yarn/apache-hadoop-install-dir/conf:/home/yarn/submarine-release/0.2.0/hadoop-submarine-dist-0.2.0-hadoop-3.1/hadoop-submarine-all-0.2.0-hadoop-3.1.jar \
java org.apache.hadoop.yarn.submarine.client.cli.Cli job run \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ \
  --verbose \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.1.2 \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow:demo \
  --input_path hdfs://default/user/yarn/cifar-10-data  \
  --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
  --worker_resources memory=2G,vcores=1  \
  --worker_launch_cmd "cd /cifar10_estimator && python cifar10_main.py --data-dir=%input_path% --job-dir=%checkpoint_path% --num-gpus=0 --train-steps=2"
