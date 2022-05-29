#!/bin/bash
echo ""
echo "================================================================================"
echo " Switched to GraalVM 22.1.0 JDK 17 (Community)"
echo "================================================================================"
export PATH=$PATH:$GRAAL17_HOME'/bin'
export JAVA_HOME=$GRAAL17_HOME
echo "JAVA_HOME="$JAVA_HOME
[ -v PATH_TO_FX ]
	echo "PATH_TO_FX="$PATH_TO_FX 

[ -v PATH_TO_FX_MODS ]
	echo "PATH_TO_FX_MODS="$PATH_TO_FX_MODS
echo ""
java -version
echo ""