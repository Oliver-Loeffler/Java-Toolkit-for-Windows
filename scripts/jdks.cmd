@ECHO OFF
ECHO ===============================================
ECHO  Available JDKs:
ECHO ===============================================
if defined JDK8_HOME echo %JDK8_HOME%
if defined JDK11_HOME echo %JDK11_HOME%
if defined JDK17_HOME echo %JDK17_HOME%
if defined JDK18_HOME echo %JDK18_HOME%
if defined GRAAL17_HOME echo %GRAAL17_HOME%
if defined JAVA_HOME echo %JAVA_HOME% (current JDK)
