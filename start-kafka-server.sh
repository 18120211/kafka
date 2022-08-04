#Stop zookeeper and broker
zookeeper-server-stop.sh
kafka-server-stop.sh

# Start zookeeper
zookeeper-server-start.sh -daemon ./config/zookeeper.properties

# Start kafka broker server
kafka-server-start.sh -daemon ./config/broker-0.properties 
kafka-server-start.sh -daemon ./config/broker-1.properties 
kafka-server-start.sh -daemon ./config/broker-2.properties 