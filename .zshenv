JAVA_HOME=/opt/java/jdk1.6.0_45
ANT_HOME=/opt/Builder/apache-ant-1.8.4
GRADLE_HOME=/opt/Builder/gradle-3.1

typeset -U path
path=($JAVA_HOME/bin
  $GRADLE_HOME/bin
  $ANT_HOME/bin
  $path)

# Alias
alias edit="/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"
alias grep="grep --color=auto"

