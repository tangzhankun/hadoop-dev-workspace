#!/bin/bash
hdfs dfs -rm -r .yarn/services/tf-job-001
yarn jar $HADOOP_BASE_DIR/home/share/hadoop/yarn/hadoop-yarn-submarine-3.3.0-SNAPSHOT.jar job run \
  -verbose \
  -wait_job_finish \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-oracle \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.2.0-SNAPSHOT \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow \
  --input_path hdfs:///user/yarn/cifar-10-data  \
  --checkpoint_path hdfs:///user/yarn/cifar-10-jobdir \
  --worker_resources memory=4G,vcores=2  \
  --worker_launch_cmd "/run_cifar10_with_hdfs.sh"

# for test purpose
#  --worker_launch_cmd "cat /proc/1/cgroup"
