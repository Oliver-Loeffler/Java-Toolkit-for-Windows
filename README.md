# Customized Installer for a Java Developers Setup on Windows 10

It can be quite time consuming to setup and prepare a new developer PC - especially in restricted environments.
This experiment uses InnoSetup to create an installable bundle providing all necessary tooling:

* The installation does not require elevated privileges, everything works per user.
* Eclipse IDE for Java Developers (2022-03)
* Adoptium / Temuring LTS JDKs: 11, 17 
* Most recent Adoptium / Temuring JDK: 18
* Zulu8 JDK with JavaFX - sometimes one still needs Java8
* GraalVM 22.1 Community Edition with Java 17 support
* OpenJFX 18 together with SceneBuilder 18
* Gradle.org Build Tool 7.4.2
* Apache Maven 3.8.5 Build Tool
* WIX Toolset 3.11.2 (is required by JPackage on Windows)
* GIT-SCM 2.36.1 for Windows

All components are collected by a download script. Then, all packages are unzipped and arranged so, that InnoSetup can consume all packages.
Gradle will by default use the provided Java 17 as runtime. At this point, Maven still looks for JAVA_HOME but configuring this is not mandatory.
Gradle, Maven and Git Bash are configured with scrips inside `scripts` directory.
These scripts are Java classes with main methods and these are called by InnoSetup.

On Windows Commandline and on Git-Bash for Windows, one can use the `jdks` command to list all JDKs which have been installed.
By calling `jdk8`, `jdk11`,`jdk17`,`jdk18` or `graal17` one can switch between the various JDKs on command line and Git Bash.

The installation for all these components works without admin provileges, those are not needed.
All files are installed in `C:\Users\<username>\AppData\Local\Programs\java` (which is `%LOCALAPPDATA%\Programs\java`). 

Following files are modified during installation:
* `%USERPROFILE%\.gradle\gradle.properties`
* `%USERPROFILE%\.bashrc`
* `%LOCALAPPDATA%\Programs\java\gradle-7.4.2\bin\{gradle|gradle.bat}`


## Prepare the InnoSetup Build - collect all materials

1. Clone the repository

```cmd
> git clone https://github.com/Oliver-Loeffler/Java-Toolkit-for-Windows.git
```

2. Download all components

```cmd
> cd Java-Toolkit-for-Windows
Java-Toolkit-for-Windows> download-all
```

Curl is used to perform all necessary downloads. All files will be placed in `downloads`.
The InnoSetup script then requires all files unzipped and placed in a specific folder structure.

3. Unzip all components and create required folders

```cmd
Java-Toolkit-for-Windows> unzip-all
```

4. Open the file `Java-Toolkit.iss` using the InnoSetup 6.2.1 IDE and run the package compile.

* https://jrsoftware.org/isinfo.php
* https://jrsoftware.org/isdl.php#stable
* https://mlaan2.home.xs4all.nl/ispack/innosetup-6.2.1.exe

## Helpful stuff

If you completed the InnoSetup packaging and also installed the full package on your system, you can test the installation success on Windows Commandline.
The `jdks` command will provide an overview about what is available.

```cmd
> jdks`


===============================================
 Available JDKs:
===============================================

C:\Users\Username\AppData\Local\Programs\java\zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64
C:\Users\Username\AppData\Local\Programs\java\jdk-11.0.15+10
C:\Users\Username\AppData\Local\Programs\java\jdk-17.0.3+7
C:\Users\Username\AppData\Local\Programs\java\jdk-18.0.1+10
C:\Users\Username\AppData\Local\Programs\java\graalvm-ce-java17-22.1.0

C:\Users\Username\AppData\Local\Programs\java\jdk-18.0.1+10 (current JDK)
```

Well, if JDK18 is not suitable anymore, by entering `jdk8` one could activate the Zulu8 JDK.

```cmd
>jdk8

===============================================
 Switched to JDK 1.8 (Zulu 8 with JavaFX)
===============================================

JAVA_HOME=C:\Users\Username\AppData\Local\Programs\java\zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64

openjdk version "1.8.0_332"
OpenJDK Runtime Environment (Zulu 8.62.0.19-CA-win64) (build 1.8.0_332-b09)
OpenJDK 64-Bit Server VM (Zulu 8.62.0.19-CA-win64) (build 25.332-b09, mixed mode)

```

## Installer Images

![Welcome Dialog](images/welcome.dialog.png?raw=true "Welcome Dialog")
![Component Selection Dialog](images/component.selection.dialog.png?raw=true "Component Selection Dialog")
![Additional Tasks Dialog](images/additional.tasks.dialog.png?raw=true "Additional Tasks Dialog")
![Ready To Install Dialog](images/ready.toinstall.dialog.png?raw=true "Ready To Install Dialog")
![Setup Completed Dialog](images/setup.completed.dialog.png?raw=true "Setup Completed Dialog")

## Interesting notes
* Run other installer: https://stackoverflow.com/questions/19589309/inno-setup-install-other-installer-and-run-it-before-continuing-my-install
* Task params: https://stackoverflow.com/questions/62019243/using-the-tasks-parameter-with-registry-key-entries-in-inno-setup-script
* Temp dir: https://stackoverflow.com/questions/37150558/inno-setup-define-the-tmp-location
* Environment modification: https://stackoverflow.com/questions/3304463/how-do-i-modify-the-path-environment-variable-when-running-an-inno-setup-install
