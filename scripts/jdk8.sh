#!/bin/bash
echo ""
echo "==============================================="
echo " Switched to JDK 1.8 (Zulu 8 with JavaFX)"
echo "==============================================="
export PATH=$PATH:$JDK8_HOME'/bin'
export JAVA_HOME=$JDK8_HOME
echo ""
echo "JAVA_HOME="$JAVA_HOME
echo ""
java -version
echo ""