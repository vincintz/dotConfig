# JAVA_HOME=/opt/java/jdk1.8.0_221
JAVA_HOME=/opt/openjdk/openjdk-8u222-b10
JAVA_OPTS="-server -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=1024m"
JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

ANT_HOME=/opt/ant/apache-ant-1.9.5
ANT_OPTS="-server -Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=1024m -Dbuild.skipDocs=true -Dfile.encoding=UTF8"

typeset -U path
path=($JAVA_HOME/bin
  $ANT_HOME/bin
  $GIT_HOME/bin
  $path)
