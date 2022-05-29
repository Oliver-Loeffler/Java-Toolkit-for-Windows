; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Java Development Tools"
#define MyAppVersion "2022.05.28"
#define MyAppPublisher "Oliver L�ffler"
#define MyAppURL "https://www.raumzeitfalle.de"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{27A63525-6713-463B-A122-100D060DB596}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DisableWelcomePage=no
DefaultDirName={autopf}\java
DisableDirPage=yes
ChangesEnvironment=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=build
OutputBaseFilename=Java-Development-Tools
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupIconFile=JavaToolkit.ico
UninstallDisplayIcon={app}\JavaToolkitUninstall.ico
WizardImageFile=WizardImage314.bmp,WizardImage386.bmp,WizardImage459.bmp,WizardImage556.bmp,WizardImage604.bmp,WizardImage700.bmp,WizardImage797.bmp

// TODO: Update gradle and gradle.bat to use the LTS Java Version provided (update script is needed, prepend SET JAVA_HOME....)
// TODO: Update mvn accordingly

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: "full"; Description: "Eclipse, JDK8/17/18/GraalVM, OpenJFX, Build Tools"
Name: "compact"; Description: "Eclipse IDE, JDK17 and Build Tools"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "eclipse";      Description: "Eclipse IDE for Java Developers 2022-03"; Types: full compact custom;
Name: "jbang";        Description: "JBang: Unleash the power of Java!"; Types: full compact custom;
Name: "jdk8";         Description: "JDK 1.8+JavaFX (Azul/Zulu JDK)"; Types: full custom;
Name: "jdk11";        Description: "JDK 11.0.15 Adoptium/Temurin (LTS)"; Types: full custom;
Name: "jdklatest";    Description: "JDK 18.0.1  Adoptium/Temurin"; Types: full custom;
Name: "jdklts";       Description: "JDK 17.0.3  Adoptium/Temurin (LTS)"; Flags: fixed; Types: full compact custom;
Name: "grllatest";    Description: "GraalVM Oracle/Commmunity Edition (22.1.0r17)"; Types: full custom;
Name: "javafx";       Description: "OpenJFX 18.0.1: jmods, sdk and javadoc"; Types: full custom;
Name: "gradle";       Description: "Build Tool: Gradle 7.4.2"; Types: full compact;
Name: "maven";        Description: "Build Tool: Apache Maven 3.8.5"; Types: full compact;
Name: "wixtoolset";   Description: "WIX Toolset 3.11.2.4516"; Types: full custom;
;Name: "wixtoolset";   Description: "Install/Update WIX Toolset 3.11.2.4516"; Types: full custom;
Name: "scenebuilder"; Description: "Install/Update Gluon SceneBuilder 18.0.0"; Types: full custom;
Name: "git";          Description: "Install/Update Git for Windows 2.36.1 64bit"; Types: full compact custom;

[Tasks]
Name: "desktopicon";   Description: "Create Desktop Icon for Eclipse";         GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; Components: eclipse;
Name: "starmenuicon";  Description: "Create Start Menu Icon for Eclipse.";     GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; Components: eclipse;
Name: "jfxjavadocicon";Description: "Create Start Menu Icon OpenJFX Javadoc."; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; Components: javafx;
Name: "javahome_lts";  Description: "Configure JAVA_HOME to jdk-17.0.3+7";     GroupDescription: "Environment Configuration"; Flags: unchecked; Components: jdklts;
Name: "javapath_lts";  Description: "Add Java-17 to environment path";         GroupDescription: "Environment Configuration"; Flags: unchecked; Components: jdklts;
Name: "wix_path";      Description: "Add WIX Toolset to environment path";     GroupDescription: "Environment Configuration"; Components: wixtoolset;
;Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; Components: eclipse;

;Define the source (and destination) path names here
#define eclipse_ide      "eclipse-2022-03"
#define jbang_cli        "jbang-0.94.0"
#define jdk_8__zulufx    "zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64"
#define jdk11_temurin    "jdk-11.0.15+10"
#define jdk17_temurin    "jdk-17.0.3+7"
#define jdk18_temurin    "jdk-18.0.1+10"
#define graalvm22_1_0    "graalvm-ce-java17-22.1.0"
#define openjfx18_doc    "javafx-18.0.1-javadoc"
#define openjfx18_sdk    "javafx-sdk-18.0.1"
#define openjfx18_mod    "javafx-jmods-18.0.1"
#define gradle_tool      "gradle-7.4.2"
#define maven__tool      "apache-maven-3.8.5"
#define wixtoolset       "wix-3.11.2"
#define wixts__exe       "wix-3.11.exe"
#define gitscm_exe       "Git-2.36.1-64-bit.exe"
#define scenebuilder_msi "SceneBuilder-18.0.0.msi"

#define EclipseIdeName "Eclipse Java IDE 2022-03"
#define EclipseIdeExe "eclipse-2022-03\eclipse.exe"
#define JavaFxJavaDocLinkName "JavaFX 18.0.1 Documentation"
#define JavaFxJavaDocLinkFile "javafx-18.0.1-javadoc\index.html"

[Files]
Source: "JavaToolkitUninstall.ico"; DestDir: "{app}"; Components: jdklts;
Source: "{#jdk17_temurin}\*";  DestDir: "{app}\{#jdk17_temurin}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: jdklts;

Source: "scripts\AddGitBashEnvironmentVariable.java"; DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;
Source: "scripts\AddGitBashSourceAlias.java";         DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;
Source: "scripts\RemoveFromGitBashEnvironment.java";  DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;
Source: "scripts\UpdateMavenConfiguration.java";      DestDir: "{app}\scripts"; Flags: ignoreversion; AfterInstall: ConfigureMaven; Components: maven;
Source: "scripts\UpdateGradleProperties.java";        DestDir: "{app}\scripts"; Flags: ignoreversion; AfterInstall: ConfigureGradle; Components: gradle;
Source: "scripts\UpdateGradleJavaHome.java";          DestDir: "{app}\scripts"; Flags: ignoreversion; Components: gradle;


Source: "scripts\jdks.cmd";    DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;
Source: "scripts\jdks.sh";     DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;    AfterInstall: AddGitBashSourceAlias('jdks',        '{app}\scripts\jdks.sh')
Source: "scripts\jdk8.cmd";    DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdk8;      AfterInstall: AddGitBashEnvironment('JDK8_HOME',   '{app}\{#jdk_8__zulufx}')
Source: "scripts\jdk8.sh";     DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdk8;      AfterInstall: AddGitBashSourceAlias('jdk8',        '{app}\scripts\jdk8.sh')
Source: "scripts\jdk11.cmd";   DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdk11;     AfterInstall: AddGitBashEnvironment('JDK11_HOME',  '{app}\{#jdk11_temurin}')
Source: "scripts\jdk11.sh";    DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdk11;     AfterInstall: AddGitBashSourceAlias('jdk11',       '{app}\scripts\jdk11.sh')
Source: "scripts\jdk17.cmd";   DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;    AfterInstall: AddGitBashEnvironment('JDK17_HOME',  '{app}\{#jdk17_temurin}')
Source: "scripts\jdk17.sh";    DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklts;    AfterInstall: AddGitBashSourceAlias('jdk17',       '{app}\scripts\jdk17.sh')
Source: "scripts\jdk18.cmd";   DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklatest; AfterInstall: AddGitBashEnvironment('JDK18_HOME',  '{app}\{#jdk18_temurin}')
Source: "scripts\jdk18.sh";    DestDir: "{app}\scripts"; Flags: ignoreversion; Components: jdklatest; AfterInstall: AddGitBashSourceAlias('jdk18',       '{app}\scripts\jdk18.sh')
Source: "scripts\graal17.cmd"; DestDir: "{app}\scripts"; Flags: ignoreversion; Components: grllatest; AfterInstall: AddGitBashEnvironment('GRAAL17_HOME','{app}\{#graalvm22_1_0}')
Source: "scripts\graal17.sh";  DestDir: "{app}\scripts"; Flags: ignoreversion; Components: grllatest; AfterInstall: AddGitBashSourceAlias('graal17',     '{app}\scripts\graal17.sh')

Source: "{#eclipse_ide}\*";  DestDir: "{app}\{#eclipse_ide}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: eclipse;
Source: "{#jbang_cli}\*";    DestDir: "{app}\{#jbang_cli}";   Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: jbang;
Source: "{#maven__tool}\*";  DestDir: "{app}\{#maven__tool}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: maven;
Source: "{#gradle_tool}\*";  DestDir: "{app}\{#gradle_tool}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; AfterInstall: ConfigureGradleJavaHome('{app}\{#gradle_tool}','{app}\{#jdk17_temurin}'); Components: gradle;

Source: "{#jdk_8__zulufx}\*"; DestDir: "{app}\{#jdk_8__zulufx}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: jdk8;
Source: "{#jdk11_temurin}\*"; DestDir: "{app}\{#jdk11_temurin}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: jdk11;
Source: "{#jdk18_temurin}\*"; DestDir: "{app}\{#jdk18_temurin}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: jdklatest;
Source: "{#graalvm22_1_0}\*"; DestDir: "{app}\{#graalvm22_1_0}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: grllatest;

Source: "{#openjfx18_doc}\*"; DestDir: "{app}\{#openjfx18_doc}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: javafx;
Source: "{#openjfx18_mod}\*"; DestDir: "{app}\{#openjfx18_mod}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: javafx;
Source: "{#openjfx18_sdk}\*"; DestDir: "{app}\{#openjfx18_sdk}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: javafx;

Source: "{#wixtoolset}\*";    DestDir: "{app}\{#wixtoolset}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak sortfilesbyextension; Components: wixtoolset;
;Source: "wix311.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall; AfterInstall: RunWixInstaller; Components: wixtoolset;

Source: "{#gitscm_exe}";       DestDir: "{tmp}"; Flags: deleteafterinstall; AfterInstall: RunGitInstaller; Components: git;
Source: "{#scenebuilder_msi}"; DestDir: "{tmp}"; Flags: deleteafterinstall; AfterInstall: RunSceneBuilderInstaller; Components: scenebuilder;
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
procedure RunGitInstaller;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\{#gitscm_exe}'), '', '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Failed to install GIT for Windows!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunWixInstaller;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\{#wixts__exe}'), '', '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Failed to install WIX Toolset!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure RunSceneBuilderInstaller;
var
  ResultCode: Integer;
begin
  if not ShellExec('', 'msiexec.exe', ExpandConstant('/i "{tmp}\{#scenebuilder_msi}"'), '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Failed to install SceneBuilder for Windows!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure ConfigureGradle;
var
  ResultCode: Integer;
begin
  if not ShellExec('',ExpandConstant('{app}\{#jdk17_temurin}\bin\java.exe'),
                      ExpandConstant('{app}\scripts\UpdateGradleProperties.java'),
                      '',
                      SW_HIDE,
                      ewWaitUntilTerminated,
                      ResultCode)
  then
    MsgBox('Failed modify Gradle Properties!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure ConfigureGradleJavaHome(gradleHome: string; javaHome: string);
var
  ResultCode: Integer;
begin
  if not ShellExec('',ExpandConstant('{app}\{#jdk17_temurin}\bin\java.exe'),
                      ExpandConstant('{app}\scripts\UpdateGradleJavaHome.java '+gradleHome+' '+javaHome),
                      '',
                      SW_HIDE,
                      ewWaitUntilTerminated,
                      ResultCode)
  then
    MsgBox('Failed modify Gradle Properties!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure AddGitBashEnvironment(variableName: string; variableValue: string);
var
  ResultCode: Integer;
begin
  if not ShellExec('',ExpandConstant('{app}\{#jdk17_temurin}\bin\java.exe'), 
                      ExpandConstant('{app}\scripts\AddGitBashEnvironmentVariable.java '+variableName+' '+variableValue),
                      '', 
                      SW_HIDE, 
                      ewWaitUntilTerminated, 
                      ResultCode)
  then
    MsgBox('Failed add/modify variable in Git Bash environment!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure AddGitBashSourceAlias(alias: string; script: string);
var
  ResultCode: Integer;
begin
  if not ShellExec('',ExpandConstant('{app}\{#jdk17_temurin}\bin\java.exe'), 
                      ExpandConstant('{app}\scripts\AddGitBashSourceAlias.java '+alias+' '+script),
                      '', 
                      SW_HIDE, 
                      ewWaitUntilTerminated, 
                      ResultCode)
  then
    MsgBox('Failed to define alias in Git Bash environment!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure ConfigureMaven;
var
  ResultCode: Integer;
begin
  if not ShellExec('',ExpandConstant('{app}\{#jdk17_temurin}\bin\java.exe'), ExpandConstant('{app}\scripts\UpdateMavenConfiguration.java'), '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Failed update Maven Configuration!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;


[Registry]
Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\{#gradle_tool}\bin"; \
    Check: NeedsAddPath('{app}\{#gradle_tool}\bin'); Components: gradle

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\{#maven__tool}\bin"; \
    Check: NeedsAddPath('{app}\{#maven__tool}\bin'); Components: maven

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\{#jdk17_temurin}\bin"; \
    Check: NeedsAddPath('{app}\{#jdk17_temurin}\bin'); Tasks: javapath_lts; Components: jdklts

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\{#jbang_cli}\bin"; \
    Check: NeedsAddPath('{app}\{#jbang_cli}\bin'); Components: jbang

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\scripts"; \
    Check: NeedsAddPath('{app}\scripts'); Components: jdklts

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\{#wixtoolset}"; \
    Check: NeedsAddPath('{app}\{#wixtoolset}'); Tasks: wix_path; Components: wixtoolset

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "JDK8_HOME"; ValueData: "{app}\{#jdk_8__zulufx}"; Components: jdk8

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "JDK11_HOME"; ValueData: "{app}\{#jdk11_temurin}"; Components: jdk11

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "JDK17_HOME"; ValueData: "{app}\{#jdk17_temurin}"; Components: jdklts

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "JDK18_HOME"; ValueData: "{app}\{#jdk18_temurin}"; Components: jdklatest

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "GRAAL17_HOME"; ValueData: "{app}\{#graalvm22_1_0}"; Components: grllatest

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "WIX"; ValueData: "{app}\{#wixtoolset}"; Components: wixtoolset

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "PATH_TO_FX_MODS"; ValueData: "{app}\{#openjfx18_mod}"; Components: javafx

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "PATH_TO_FX"; ValueData: "{app}\{#openjfx18_sdk}\lib"; Components: javafx

Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: "JAVA_HOME"; ValueData: "{app}\{#jdk17_temurin}"; Tasks: javahome_lts; Components: jdklts

[Icons]
Name: "{autoprograms}\{#EclipseIdeName}"; Filename: "{app}\{#EclipseIdeExe}"; Tasks: desktopicon; Components: eclipse;
Name: "{autodesktop}\{#EclipseIdeName}"; Filename: "{app}\{#EclipseIdeExe}"; Tasks: desktopicon; Components: eclipse;
Name: "{autoprograms}\{#JavaFxJavaDocLinkName}"; Filename: "{app}\{#JavaFxJavaDocLinkFile}"; Tasks: jfxjavadocicon; Components: javafx;


[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_CURRENT_USER,
    'Environment', 'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  { look for the path with leading and trailing semicolon }
  { Pos() returns 0 if not found }
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

const
  EnvironmentKey = 'Environment';

procedure RemovePath(Path: string; Item: string);
var
  Paths: string;
  P: Integer;
begin
  if not RegQueryStringValue(HKEY_CURRENT_USER, EnvironmentKey, Item, Paths) then
  begin
    Log('PATH not found');
  end
    else
  begin
    Log(Format('PATH is [%s]', [Paths]));

    P := Pos(';' + Uppercase(Path) + ';', ';' + Uppercase(Paths) + ';');
    if P = 0 then
    begin
      Log(Format('Path [%s] not found in PATH', [Path]));
    end
      else
    begin
      if P > 1 then P := P - 1;
      Delete(Paths, P, Length(Path) + 1);
      Log(Format('Path [%s] removed from PATH => [%s]', [Path, Paths]));

      if RegWriteStringValue(HKEY_CURRENT_USER, EnvironmentKey, Item, Paths) then
      begin
        Log('PATH written');
      end
        else
      begin
        Log('Error writing PATH');
      end;
    end;
  end;
end;

procedure RemoveFromGitBashConfig(operation: string; itemName: string);
var
  ResultCode: Integer;
begin
  if not ShellExec('',ExpandConstant('{app}\{#jdk17_temurin}\bin\java.exe'), 
                      ExpandConstant('{app}\scripts\RemoveFromGitBashEnvironment.java '+operation+' '+itemName),
                      '', 
                      SW_HIDE, 
                      ewWaitUntilTerminated, 
                      ResultCode)
  then
    MsgBox('Failed modify Git Bash Environment!' + #13#10 +
        SysErrorMessage(ResultCode), mbError, MB_OK);
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then
  begin
    RemovePath(ExpandConstant('{app}\{#gradle_tool}\bin'),  'Path');
    RemovePath(ExpandConstant('{app}\{#maven__tool}\bin'),  'Path');
    RemovePath(ExpandConstant('{app}\{#jdk17_temurin}\bin'),'Path');
    RemovePath(ExpandConstant('{app}\{#jbang_cli}\bin'),    'Path');
    RemovePath(ExpandConstant('{app}\{#wixtoolset}'),       'Path');
    RemovePath(ExpandConstant('{app}\scripts'),             'Path');
    RemovePath(ExpandConstant('{app}\{#openjfx18_mod}'),    'PATH_TO_FX_MODS');
    RemovePath(ExpandConstant('{app}\{#openjfx18_sdk}\lib'),'PATH_TO_FX');
    RemovePath(ExpandConstant('{app}\{#jdk_8__zulufx}'),    'JDK8_HOME');
    RemovePath(ExpandConstant('{app}\{#jdk11_temurin}'),    'JDK11_HOME');
    RemovePath(ExpandConstant('{app}\{#jdk17_temurin}'),    'JDK17_HOME');
    RemovePath(ExpandConstant('{app}\{#jdk18_temurin}'),    'JDK18_HOME');
    RemovePath(ExpandConstant('{app}\{#graalvm22_1_0}'),    'GRAAL17_HOME');
    RemovePath(ExpandConstant('{app}\{#wixtoolset}'),       'WIX');    
    RemoveFromGitBashConfig('alias', 'jdks')
    RemoveFromGitBashConfig('alias', 'jdk8')
    RemoveFromGitBashConfig('alias', 'jdk11')
    RemoveFromGitBashConfig('alias', 'jdk17')
    RemoveFromGitBashConfig('alias', 'jdk18')
    RemoveFromGitBashConfig('alias', 'graal17')
    RemoveFromGitBashConfig('export', 'JDK8_HOME')
    RemoveFromGitBashConfig('export', 'JDK11_HOME')
    RemoveFromGitBashConfig('export', 'JDK17_HOME')
    RemoveFromGitBashConfig('export', 'JDK18_HOME')
    RemoveFromGitBashConfig('export', 'GRAAL17_HOME')
  end;
end;

// TODO: Stop Gradle Daemon - cleanup app directory using Windows RD command (!)
