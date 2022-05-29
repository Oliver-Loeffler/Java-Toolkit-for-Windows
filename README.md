# Customized Installer for a Java Developers Setup on Windows 10

It can be quite time consuming to setup and prepare a new developer PC.
This experiment uses InnoSetup to create an installable bundle providing all necessary tooling:

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
	git clone https://github.com/Oliver-Loeffler/Java-Toolkit-for-Windows.git
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
> unzip-all
```

4. Open the file `Java-Toolkit.iss` using the InnoSetup 6.2.1 IDE and run the package compile.

* https://jrsoftware.org/isinfo.php
* https://jrsoftware.org/isdl.php#stable
* https://mlaan2.home.xs4all.nl/ispack/innosetup-6.2.1.exe


## Interesting notes
* Run other installer: https://stackoverflow.com/questions/19589309/inno-setup-install-other-installer-and-run-it-before-continuing-my-install
* Task params: https://stackoverflow.com/questions/62019243/using-the-tasks-parameter-with-registry-key-entries-in-inno-setup-script
* Temp dir: https://stackoverflow.com/questions/37150558/inno-setup-define-the-tmp-location
* Environment modification: https://stackoverflow.com/questions/3304463/how-do-i-modify-the-path-environment-variable-when-running-an-inno-setup-install
