#!/bin/bash
hdfs dfs -rm -r .yarn/services/tf-job-001
hdfs dfs -rm -R -f submarine/jobs/tf-job-001
yarn jar $HADOOP_BASE_DIR/home/share/hadoop/yarn/hadoop-yarn-submarine-3.3.0-SNAPSHOT.jar job run \
  -verbose \
  -wait_job_finish \
  --env DOCKER_JAVA_HOME=/usr/lib/jvm/java-8-oracle \
  --env DOCKER_HADOOP_HDFS_HOME=/hadoop-3.2.0-SNAPSHOT \
  --input_path hdfs://default/user/yarn/cifar-10-data  \
  --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
  --name tf-job-001 \
  --docker_image tangzhankun/tensorflow \
  --localization "hdfs:///user/yarn/mydir.zip:." \
  --worker_resources memory=4G,vcores=2  \
  --worker_launch_cmd "ls ./* -l && echo hello"

#test result: read only not working


# for test purpose
#  --worker_launch_cmd "cat /proc/1/cgroup"
# --checkpoint_path hdfs://default/user/yarn/cifar-10-jobdir \
#  --checkpoint_path hdfs://default/user/yarn/submarine/jobs/tf-job-001/staging \
#  --input_path hdfs://default/user/yarn/cifar-10-data  \
#  -keep_staging_dir \
#  --tensorboard \
#  --quicklink notebook_ui="https://master-0:7070" \
#  --worker_launch_cmd "cd /cifar10_estimator && python cifar10_main.py --data-dir=%input_path% --job-dir=%checkpoint_path% --num-gpus=0 --train-steps=2"
#  --localization "test_kill9.sh:." \
#  --localization "mydir:." \
#  --localization "hdfs:///user/yarn/test_kill9.sh:./test_kill.sh:rw" \
#  --localization "hdfs:///user/yarn/myhdfsdir:/tmp/mydir:rw" \
#  --localization "test_kill9.sh:./test_kill.sh" \
#  --localization "test_kill9.sh:./test_kill.sh" \
#  --localization "/home/yarn/apache-hadoop-install-dir/hadoop-dev-workspace/mydir:." \
#  --localization "hdfs:///user/yarn/myhdfsdir:./mydir:rw" \
#  --localization "hdfs:///user/yarn/myhdfsdir:." \
