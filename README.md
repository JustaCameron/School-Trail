How to Run:

On Windows
1) Download Flutter
2) Download Android Studio
3) Install google pixel 3a sdk with resolution 1080x2220
:Tools -> Device Manager -> Create Device
4) Install Android SDK Command-line Tools (latest)
:Tools -> SDK Manager -> SDK Tools
5) Open VsCode, Open Terminal and type "flutter doctor"
6) Run "flutter doctor --android-licenses"

Possible Error:
Exception in thread "main" java.lang.UnsupportedClassVersionError: com/android/sdklib/tool/sdkmanager/SdkManagerCli has been compiled by a more recent version of the Java Runtime (class file version 61.0), this version of the Java Runtime only recognizes class file versions up to 52.0
Solution:
Your JDK is out of date. 
a) Uninstall current JDK by going to Apps & Features and locating your java installation. Then follow this link to download a newer version of JDK (DO NOT DOWNLOAD JDK 20) - https://www.oracle.com/java/technologies/downloads/#java17
b) Be aware of where the installation directory is (recommend copying it during installation).
c) Go to System -> Advanced system settings -> environment variables
d) Under System Variables, click 'New' -> set variable name to "JAVA_HOME" & variable value to the directory you installed your new JDK
e) Look under User variables -> Select Path -> Edit -> New -> paste path to the directory you installed your new JDK
e) Now rerun "flutter doctor --android-licenses"

7) Bottom right bar of Vscode -> Select 'Windows (windows-x64)' or whichever device is set as default -> You should now see the option to select your Android Emulator.
8) Select your Android Emulator and run main.dart
