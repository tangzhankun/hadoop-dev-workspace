#!/bin/bash
#VERSION=3.2.0
VERSION=3.3.0-SNAPSHOT
hdfs dfs -rm -r .yarn/services/tf-job-001
hdfs dfs -rm -R -f submarine/jobs/tf-job-001
yarn jar $HADOOP_COMMON_HOME/share/hadoop/yarn/hadoop-yarn-submarine-${VERSION}.jar job run \
  -verbose \
  -wait_job_finish \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.1.2 \
  --input_path hdfs://default/user/yarn/cifar-10-data  \
  --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow:demo \
  --worker_resources memory=4G,vcores=2  \
  --worker_launch_cmd "cd /cifar10_estimator && python cifar10_main.py --data-dir=%input_path% --job-dir=%checkpoint_path% --num-gpus=0 --train-steps=100"

# for test purpose
#  --worker_launch_cmd "cat /proc/1/cgroup"
# --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
#  --checkpoint_path hdfs://default/user/yarn/submarine/jobs/tf-job-001/staging \
#  --input_path hdfs://default/user/yarn/cifar-10-data  \
#  -keep_staging_dir \
#  --tensorboard \
#  --quicklink notebook_ui="https://master-0:7070" \
