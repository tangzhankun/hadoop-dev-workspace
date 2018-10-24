#!/bin/bash
sudo mkdir -p /sys/fs/cgroup/cpu/hadoop-yarn
sudo chown -R yarn /sys/fs/cgroup/cpu/hadoop-yarn
sudo mkdir -p /sys/fs/cgroup/memory/hadoop-yarn
sudo chown -R yarn /sys/fs/cgroup/memory/hadoop-yarn
sudo mkdir -p /sys/fs/cgroup/blkio/hadoop-yarn
sudo chown -R yarn /sys/fs/cgroup/blkio/hadoop-yarn
sudo mkdir -p /sys/fs/cgroup/net_cls/hadoop-yarn
sudo chown -R yarn /sys/fs/cgroup/net_cls/hadoop-yarn
sudo mkdir -p /sys/fs/cgroup/devices/hadoop-yarn
sudo chown -R yarn /sys/fs/cgroup/devices/hadoop-yarn
