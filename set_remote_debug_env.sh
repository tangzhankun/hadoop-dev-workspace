#if want to debug process from the very beginning. set suspend to y
export YARN_RESOURCEMANAGER_OPTS="-Dcom.cloudera.appname=ResourceManager -Djava.net.preferIPv4Stack=true -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -Xloggc:$GC_LOG_DIR/resourcemanager.gc.log.$GC_LOG_DATE -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=3 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=6001"

export YARN_NODEMANAGER_OPTS="-Dcom.netease.appname=NodeManager -Djava.net.preferIPv4Stack=true -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -Xloggc:$GC_LOG_DIR/nodemanager.gc.log.$GC_LOG_DATE -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=3  -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=6002"

