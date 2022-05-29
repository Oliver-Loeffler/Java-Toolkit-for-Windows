#!/bin/bash
echo ""
echo "==============================================="
echo " Available JDKs:"
echo "==============================================="
echo ""
[ -v JDK8_HOME ]
	echo $JDK8_HOME

[ -v JDK11_HOME ]
	echo $JDK11_HOME

[ -v JDK17_HOME ]
	echo $JDK17_HOME

[ -v JDK18_HOME ]
	echo $JDK18_HOME

[ -v GRAAL17_HOME ]
	echo $GRAAL17_HOME

[ -v JAVA_HOME ]
	echo "$JAVA_HOME (current JDK)"
echo ""
