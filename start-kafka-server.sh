#Stop zookeeper and broker
zookeeper-server-stop 
kafka-server-stop

# Start zookeeper
zookeeper-server-start -daemon ./config/zookeeper.properties

# Start kafka broker server
kafka-server-start -daemon ./config/broker-0.properties 
kafka-server-start -daemon ./config/broker-1.properties 
kafka-server-start -daemon ./config/broker-2.properties 