@ECHO OFF
setlocal
set PATH=.\prepare\curl;.\prepare\unzip;%PATH%
mkdir downloads
cd downloads

ECHO.
ECHO GraalVM...
curl -LJO "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.1.0/graalvm-ce-java17-windows-amd64-22.1.0.zip.sha256" --output graalvm-ce-java17-windows-amd64-22.1.0.zip.sha256
curl -LJO "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.1.0/graalvm-ce-java17-windows-amd64-22.1.0.zip" --output graalvm-ce-java17-windows-amd64-22.1.0.zip

ECHO.
ECHO Eclipse...
curl -LJO "https://ftp.fau.de/eclipse/technology/epp/downloads/release/2022-03/R/eclipse-java-2022-03-R-win32-x86_64.zip" --output eclipse-java-2022-03-R-win32-x86_64.zip

ECHO.
ECHO Gradle...
curl -LJO "https://services.gradle.org/distributions/gradle-7.4.2-bin.zip.sha256" --output gradle-7.4.2-bin.zip.sha256
curl -LJO "https://services.gradle.org/distributions/gradle-7.4.2-bin.zip" --output gradle-7.4.2-bin.zip

ECHO.
ECHO Git...
curl -LJO "https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe" --output Git-2.36.1-64-bit.exe

ECHO.
ECHO OpenJFX...
curl -LJO "https://download2.gluonhq.com/openjfx/18.0.1/openjfx-18.0.1_windows-x64_bin-sdk.zip" --output openjfx-18.0.1_windows-x64_bin-sdk.zip
curl -LJO "https://download2.gluonhq.com/openjfx/18.0.1/openjfx-18.0.1_windows-x64_bin-jmods.zip" --output openjfx-18.0.1_windows-x64_bin-jmods.zip
curl -LJO "https://download2.gluonhq.com/openjfx/18.0.1/openjfx-18.0.1-javadoc.zip" --output openjfx-18.0.1-javadoc.zip
curl -LJO "https://github.com/gluonhq/scenebuilder/releases/download/18.0.0/SceneBuilder-18.0.0.msi" --output SceneBuilder-18.0.0.msi

ECHO.
ECHO JBang...
curl -LJO "https://github.com/jbangdev/jbang/releases/download/v0.94.0/jbang-0.94.0.zip" --output jbang-0.94.0.zip
curl -LJO "https://github.com/jbangdev/jbang/releases/download/v0.94.0/jbang-0.94.0.zip.sha256" --output jbang-0.94.0.zip.sha256

ECHO.
ECHO Maven...
curl -LJO "https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip" --output apache-maven-3.8.5-bin.zip
curl -LJO "https://downloads.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip.sha512" --output apache-maven-3.8.5-bin.zip.sha512
ECHO.
ECHO Adoptium JDKs...
curl -LJO "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip"
curl -LJO "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.3%2B7/OpenJDK17U-jdk_x64_windows_hotspot_17.0.3_7.zip"
curl -LJO "https://github.com/adoptium/temurin18-binaries/releases/download/jdk-18.0.1%2B10/OpenJDK18U-jdk_x64_windows_hotspot_18.0.1_10.zip"

ECHO.
ECHO WIX Toolset
curl -LJO "https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip" --output wix311-binaries.zip
curl -LJO "https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311.exe" --output wix311.exe
curl -LJO "https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64.zip" --output zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64.zip

cd ..