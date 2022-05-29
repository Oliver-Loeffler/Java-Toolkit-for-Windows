#!/bin/bash
echo ""
echo "==============================================================================="
echo " Switched to JDK 11 (Temurin)"
echo "==============================================================================="
export PATH=$PATH:$JDK11_HOME'/bin'
export JAVA_HOME=$JDK11_HOME
echo "JAVA_HOME="$JAVA_HOME
[ -v PATH_TO_FX ]
	echo "PATH_TO_FX="$PATH_TO_FX 

[ -v PATH_TO_FX_MODS ]
	echo "PATH_TO_FX_MODS="$PATH_TO_FX_MODS
echo ""
java -version
echo ""