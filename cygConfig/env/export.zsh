export JAVA_OPTS="-Xms512m -Xmx1024m -XX:MaxPermSize=128m"
export JAVA_HOME=/datalex/java/jdk

export ANT_OPTS="-server -Xmx1024m"
export ANT_HOME=/datalex/ant/ant

export CVSROOT=":pserver:vincintz.reyes@10.160.254.238:/src/cvs"
export CVS_HOME="cygdrive/c/Program Files (x86)/cvsnt"

typeset -U path
path=($JAVA_HOME/bin $ANT_HOME/bin $path)
export PATH
