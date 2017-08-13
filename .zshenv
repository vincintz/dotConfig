JAVA_HOME=/opt/java/jdk1.8.0_144
GRADLE_HOME=/opt/gradle/gradle-4.1
MAVEN_HOME=/opt/maven/apache-maven-3.5.0
ANT_HOME=/opt/ant/apache-ant-1.10.1

typeset -U path
path=(
  $JAVA_HOME/bin
  $GRADLE_HOME/bin
  $MAVEN_HOME/bin
  $ANT_HOME/bin
  $path)

# Alias
alias edit="/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"
alias grep="grep --color=auto"

