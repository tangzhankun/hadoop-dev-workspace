#!/bin/bash
export HADOOP_BASE_DIR=${HOME}/apache-hadoop-install-dir
export HADOOP_LOG_DIR=${HOME}/apache-hadoop-install-dir/logs
export HADOOP_PID_DIR=${HADOOP_BASE_DIR}
export HADOOP_CONF_DIR=${HOME}/apache-hadoop-install-dir/conf
export HADOOP_COMMON_HOME=/opt/code/hadoop/hadoop-dist/target/hadoop-3.3.0-SNAPSHOT
export HADOOP_HDFS_HOME=${HADOOP_COMMON_HOME}
export HADOOP_MAPRED_HOME=${HADOOP_COMMON_HOME}

# Yarn env override:
export HADOOP_YARN_HOME=${HADOOP_COMMON_HOME}
export YARN_LOG_DIR=${HADOOP_LOG_DIR}/yarn
#classpath override to search hadoop loc
export CLASSPATH=/usr/share/java/:${HADOOP_COMMON_HOME}/share
#Finally update your PATH
export PATH=${HADOOP_COMMON_HOME}/bin:${HADOOP_COMMON_HOME}/sbin:${HADOOP_COMMON_HOME}/libexec:${PATH}
