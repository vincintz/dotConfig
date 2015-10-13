JAVA_HOME=$HOME/Programs/jdk1.8.0_45
SBT_HOME=$HOME/Programs/sbt
MAVEN_HOME=$HOME/Programs/apache-maven-3.3.3
MONGO_HOME=$HOME/Programs/mongodb-linux-i686-3.0.5

typeset -U path
path=($JAVA_HOME/bin
  $HOME/bin
  $SBT_HOME/bin
  $MONGO_HOME/bin
  $path)

