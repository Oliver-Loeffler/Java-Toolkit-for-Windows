@ECHO OFF
ECHO ===============================================
ECHO  Switched to JDK 17 (Temurin)
ECHO ===============================================
SET PATH=%JDK17_HOME%\bin;%PATH%;
SET JAVA_HOME=%JDK17_HOME%
java -version
if defined JAVA_HOME echo JAVA_HOME=%JAVA_HOME%
if defined PATH_TO_FX echo PATH_TO_FX=%PATH_TO_FX%
if defined PATH_TO_FX_MODS echo PATH_TO_FX_MODS=%PATH_TO_FX_MODS%
