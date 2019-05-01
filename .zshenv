TERM=xterm

JAVA_HOME=/opt/java/jdk1.8.0_211
JAVA_OPTS="-server -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=1024m"
JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

ANT_HOME=/opt/ant/apache-ant-1.9.5
ANT_OPTS="-server -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=1024m -Dbuild.skipDocs=true -Dfile.encoding=UTF8"

# alias
alias grep="grep --color=auto"

# Win64
CYGWIN=nodosfilewarning
WIN_APPS="/c/Program Files"
GIT_HOME=$WIN_APPS/Git/mingw64

alias ifconfig=ipconfig
alias edit="/c/Program\ Files/Notepad++/notepad++.exe"
alias open="cygstart"
alias sudo="python3 /usr/local/lib/cygwin-sudo/cygwin-sudo.py"

typeset -U path
path=($JAVA_HOME/bin
  $ANT_HOME/bin
  $GIT_HOME/bin
  $path)
