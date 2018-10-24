#!/bin/bash
yarn jar /home/yarn/apache-hadoop-install-dir/home/share/hadoop/yarn/hadoop-yarn-applications-distributedshell-3.3.0-SNAPSHOT.jar -jar /home/yarn/apache-hadoop-install-dir/home/share/hadoop/yarn/hadoop-yarn-applications-distributedshell-3.3.0-SNAPSHOT.jar -shell_command "sleep 360" -container_resources memory-mb=2048,vcores=2,nec.com/ve=2
