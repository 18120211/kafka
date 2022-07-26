# kafka
## Run the kafka server
1. Install Java 8 JDK
```bash
    sudo apt install openjdk-8-jdk
```

1. Create and update the broker configuration:
    - config/broker-0.properties
    - config/broker-1.properties
    - config/broker-2.properties

3. Create directory for log files
    - bin
    - config
    - data
        - broker0-log
        - broker1-log
        - broker2-log
        - zookeeper-log
    - logs