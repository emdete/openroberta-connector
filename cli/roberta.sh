#!/bin/sh -e
cd /usr/share/roberta
export CLASS_PATH=roberta.jar:\
libs/apiguardian-api-1.1.0.jar:\
libs/async-http-client-2.11.0.jar:\
libs/async-http-client-netty-utils-2.11.0.jar:\
libs/bcpkix-jdk15on-1.60.jar:\
libs/bcprov-jdk15on-1.60.jar:\
libs/commons-codec-1.11.jar:\
libs/commons-io-2.6.jar:\
libs/commons-lang3-3.9.jar:\
libs/commons-logging-1.2.jar:\
libs/eddsa-0.2.0.jar:\
libs/hamcrest-2.2.jar:\
libs/hamcrest-core-2.2.jar:\
libs/hamcrest-library-2.2.jar:\
libs/httpclient-4.5.12.jar:\
libs/httpcore-4.4.13.jar:\
libs/jSerialComm-2.6.0.jar:\
libs/javax.activation-1.2.0.jar:\
libs/jmdns-3.5.5.jar:\
libs/json-20190722.jar:\
libs/junit-jupiter-api-5.6.0.jar:\
libs/junit-jupiter-engine-5.6.0.jar:\
libs/junit-platform-commons-1.6.0.jar:\
libs/junit-platform-engine-1.6.0.jar:\
libs/jzlib-1.1.3.jar:\
libs/logback-classic-1.2.3.jar:\
libs/logback-core-1.2.3.jar:\
libs/netty-buffer-4.1.46.Final.jar:\
libs/netty-codec-4.1.46.Final.jar:\
libs/netty-codec-http-4.1.46.Final.jar:\
libs/netty-codec-socks-4.1.46.Final.jar:\
libs/netty-common-4.1.46.Final.jar:\
libs/netty-handler-4.1.46.Final.jar:\
libs/netty-handler-proxy-4.1.46.Final.jar:\
libs/netty-reactive-streams-2.0.4.jar:\
libs/netty-resolver-4.1.46.Final.jar:\
libs/netty-transport-4.1.46.Final.jar:\
libs/netty-transport-native-epoll-4.1.46.Final-linux-x86_64.jar:\
libs/netty-transport-native-kqueue-4.1.46.Final-osx-x86_64.jar:\
libs/netty-transport-native-unix-common-4.1.46.Final.jar:\
libs/opentest4j-1.2.0.jar:\
libs/reactive-streams-1.0.3.jar:\
libs/slf4j-api-1.7.30.jar:\
libs/sshj-0.27.0.jar:\
libs/zip4j-2.5.0.jar:\
resources
/usr/bin/java -cp $CLASS_PATH de.emdete.roberta.Main lab.open-roberta.org:443 nano ttyUSB0
