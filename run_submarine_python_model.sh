#!/bin/bash
hdfs dfs -rm -r .yarn/services/tf-job-001
yarn jar $HADOOP_BASE_DIR/home/share/hadoop/yarn/hadoop-yarn-submarine-3.2.0-SNAPSHOT.jar job run \
  -verbose \
  -wait_job_finish \
  -keep_staging_dir \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-oracle \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.2.0-SNAPSHOT \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow \
  --input_path hdfs://default/user/yarn/cifar-10-data  \
  --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
  --worker_resources memory=4G,vcores=2  \
  --worker_launch_cmd "cd /cifar10_estimator && python cifar10_main.py --data-dir=%input_path% --job-dir=%checkpoint_path% --num-gpus=0 --train-steps=2"

# for test purpose
#  --worker_launch_cmd "cat /proc/1/cgroup"
# --saved_model_path 
