#!/bin/bash

SUBMARINE_BINARY=/home/yarn/submarine-release/0.2.0/hadoop-submarine-dist-0.2.0-hadoop-3.1
CLASSPATH=$(hadoop classpath --glob):${SUBMARINE_BINARY}/hadoop-submarine-core-0.2.0.jar:${SUBMARINE_BINARY}/hadoop-submarine-tony-runtime-0.2.0.jar:/home/yarn/hadoop-dev-workspace/tony_runtime/tony-cli-0.3.13-all.jar \

java org.apache.hadoop.yarn.submarine.client.cli.Cli job run --name tf-job-001 \
 --framework tensorflow \
 --verbose \
 --input_path "" \
 --num_workers 2 \
 --worker_resources memory=1G,vcores=1 \
 --num_ps 1 \
 --ps_resources memory=1G,vcores=1 \
 --worker_launch_cmd "venv.zip/venv/bin/python mnist_distributed.py --steps 2 --data_dir /tmp/data --working_dir /tmp/mode" \
 --ps_launch_cmd "venv.zip/venv/bin/python mnist_distributed.py --steps 2 --data_dir /tmp/data --working_dir /tmp/mode" \
 --insecure \
 --conf tony.containers.resources=/home/yarn/hadoop-dev-workspace/tony_runtime/venv.zip#archive,/home/yarn/hadoop-dev-workspace/tony_runtime/mnist_distributed.py,/home/yarn/hadoop-dev-workspace/tony_runtime/tony-cli-0.3.13-all.jar

