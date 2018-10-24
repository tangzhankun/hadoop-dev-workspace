#!/bin/bash
yarn jar /home/yarn/apache-hadoop-install-dir/home/share/hadoop/yarn/hadoop-yarn-applications-distributedshell-3.3.0-SNAPSHOT.jar -jar /home/yarn/apache-hadoop-install-dir/home/share/hadoop/yarn/hadoop-yarn-applications-distributedshell-3.3.0-SNAPSHOT.jar \
-container_resources memory-mb=2048,vcores=2 \
-shell_command "echo" \
-shell_args "\"{\"0\": {\"person\": {\"name\": \"John\"}}}\""
