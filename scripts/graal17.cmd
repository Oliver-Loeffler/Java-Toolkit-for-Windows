@ECHO OFF
ECHO.
ECHO ===============================================
ECHO  Switched to GraalVM 22.1.0 JDK 17 (Community)
ECHO ===============================================
ECHO.
SET PATH=%GRAAL17_HOME%\bin;%PATH%;
SET JAVA_HOME=%GRAAL17_HOME%
java -version
ECHO.
if defined JAVA_HOME echo JAVA_HOME=%JAVA_HOME%
if defined PATH_TO_FX echo PATH_TO_FX=%PATH_TO_FX%
if defined PATH_TO_FX_MODS echo PATH_TO_FX_MODS=%PATH_TO_FX_MODS%
ECHO.
