@ECHO OFF
setlocal
set PATH=.\prepare\curl;.\prepare\unzip;%PATH%

ECHO.
ECHO GraalVM...
unzip downloads\graalvm-ce-java17-windows-amd64-22.1.0.zip -d .

ECHO.
ECHO Git...
move downloads\Git-2.36.1-64-bit.exe .

ECHO.
ECHO Eclipse...
unzip downloads\eclipse-java-2022-03-R-win32-x86_64.zip -d .
move eclipse eclipse-2022-03

ECHO.
ECHO Gradle...
unzip downloads\gradle-7.4.2-bin.zip -d .

ECHO.
ECHO OpenJFX...
unzip downloads\openjfx-18.0.1-javadoc.zip -d .
unzip downloads\openjfx-18.0.1_windows-x64_bin-sdk.zip -d .
unzip downloads\openjfx-18.0.1_windows-x64_bin-jmods.zip -d .
move downloads\SceneBuilder-18.0.0.msi .

ECHO.
ECHO JBang...
unzip downloads\jbang-0.94.0.zip -d .

ECHO.
ECHO Maven...
unzip downloads\apache-maven-3.8.5-bin.zip -d .

ECHO.
ECHO JDKs...
unzip downloads\OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip -d .
unzip downloads\OpenJDK17U-jdk_x64_windows_hotspot_17.0.3_7.zip -d .
unzip downloads\OpenJDK18U-jdk_x64_windows_hotspot_18.0.1_10.zip -d .
unzip downloads\zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64.zip -d .

ECHO.
ECHO WIX Toolset
mkdir wix-3.11.2
unzip downloads\wix311-binaries.zip -d wix-3.11.2

cd ..