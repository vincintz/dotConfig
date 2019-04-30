ORIG_JAVA_HOME=$JAVA_HOME
JAVA_HOME=/opt/java/jdk1.6.0_45

echo 'Setting Java to ' $JAVA_HOME
path[${path[(i)/opt/java/**]}]=$JAVA_HOME/bin
