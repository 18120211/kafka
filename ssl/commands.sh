-----Remerber run each of this command step by step------

#Create Root CA key and CA certificate
openssl req -new -x509 -keyout ca-key -out ca-cert -days 3650

#For zookeeper
keytool -keystore kafka.zookeeper.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.zookeeper.keystore.jks -alias zookeeper -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.zookeeper.keystore.jks -alias zookeeper -certreq -file ca-request-zookeeper
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-zookeeper -out ca-signed-zookeeper -days 3650 -CAcreateserial
keytool -keystore kafka.zookeeper.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.zookeeper.keystore.jks -alias zookeeper -import -file ca-signed-zookeeper

# For Zookeeper clients like zookeeper shell
# Use this configuration:
    # Zookeeper shell: [-zk-tls-config-file]
    # Kafka producer: --producer.config
    # kafka consumer: --consumer.config
keytool -keystore kafka.zookeeper-client.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.zookeeper-client.keystore.jks -alias zookeeper-client -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.zookeeper-client.keystore.jks -alias zookeeper-client -certreq -file ca-request-zookeeper-client
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-zookeeper-client -out ca-signed-zookeeper-client -days 3650 -CAcreateserial
keytool -keystore kafka.zookeeper-client.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.zookeeper-client.keystore.jks -alias zookeeper-client -import -file ca-signed-zookeeper-client

# For broker0
keytool -keystore kafka.broker0.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.broker0.keystore.jks -alias broker0 -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.broker0.keystore.jks -alias broker0 -certreq -file ca-request-broker0
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-broker0 -out ca-signed-broker0 -days 3650 -CAcreateserial
keytool -keystore kafka.broker0.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.broker0.keystore.jks -alias broker0 -import -file ca-signed-broker0

# For broker1
keytool -keystore kafka.broker1.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.broker1.keystore.jks -alias broker1 -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.broker1.keystore.jks -alias broker1 -certreq -file ca-request-broker1
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-broker1 -out ca-signed-broker1 -days 3650 -CAcreateserial
keytool -keystore kafka.broker1.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.broker1.keystore.jks -alias broker1 -import -file ca-signed-broker1

# For broker2
keytool -keystore kafka.broker2.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.broker2.keystore.jks -alias broker2 -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.broker2.keystore.jks -alias broker2 -certreq -file ca-request-broker2
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-broker2 -out ca-signed-broker2 -days 3650 -CAcreateserial
keytool -keystore kafka.broker2.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.broker2.keystore.jks -alias broker2 -import -file ca-signed-broker2

# For producer
keytool -keystore kafka.producer.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.producer.keystore.jks -alias producer -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.producer.keystore.jks -alias producer -certreq -file ca-request-producer
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-producer -out ca-signed-producer -days 3650 -CAcreateserial
keytool -keystore kafka.producer.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.producer.keystore.jks -alias producer -import -file ca-signed-producer

# For consumer
keytool -keystore kafka.consumer.truststore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.consumer.keystore.jks -alias consumer -validity 3650 -genkey -keyalg RSA -ext SAN=dns:localhost
keytool -keystore kafka.consumer.keystore.jks -alias consumer -certreq -file ca-request-consumer
openssl x509 -req -CA ca-cert -CAkey ca-key -in ca-request-consumer -out ca-signed-consumer -days 3650 -CAcreateserial
keytool -keystore kafka.consumer.keystore.jks -alias ca-cert -import -file ca-cert
keytool -keystore kafka.consumer.keystore.jks -alias consumer -import -file ca-signed-consumer
