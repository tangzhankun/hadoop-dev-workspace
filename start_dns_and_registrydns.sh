#!/bin/bash
sudo /opt/zookeeper-3.4.12/bin/zkServer.sh start
yarn --daemon start registrydns
