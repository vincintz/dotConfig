TERM=xterm

JAVA_HOME=/opt/java/jdk1.8.0_211
JAVA_OPTS="-server -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=1024m"
JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

ANT_HOME=/opt/ant/apache-ant-1.9.5
ANT_OPTS="-server -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=1024m -Dbuild.skipDocs=true -Dfile.encoding=UTF8"

WIN_APPS="/c/Program Files"
GIT_HOME=$WIN_APPS/Git/mingw64

typeset -U path
path=($JAVA_HOME/bin
  $ANT_HOME/bin
  $GIT_HOME/bin
  $path)

# alias
alias edit="/c/Program\ Files/Notepad++/notepad++.exe"
alias open="cygstart"
alias grep="grep --color=auto"
alias ifconfig=ipconfig
alias sudo="python3 /opt/tools/cygwin-sudo.py"
