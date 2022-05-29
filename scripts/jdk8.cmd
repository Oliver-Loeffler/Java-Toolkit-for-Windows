@ECHO OFF
ECHO.
ECHO ===============================================
ECHO  Switched to JDK 1.8 (Zulu 8 with JavaFX)
ECHO ===============================================
ECHO.
SET PATH=%JDK8_HOME%\bin;%PATH%;
SET JAVA_HOME=%JDK8_HOME%
if defined JAVA_HOME echo JAVA_HOME=%JAVA_HOME%
ECHO.
java -version
ECHO.
