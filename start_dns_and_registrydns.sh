#!/bin/bash
sudo /opt/zookeeper-3.4.14/bin/zkServer.sh start
yarn --daemon start registrydns
