ORIG_JAVA_HOME=$JAVA_HOME
JAVA_HOME=/opt/java/jdk1.7.0_80

if [[ "$ORIG_JAVA_HOME" != "$JAVA_HOME" ]] && [ -d "$JAVA_HOME" ]; then
  echo 'Setting Java to ' $JAVA_HOME
  path[${path[(i)$ORIG_JAVA_HOME/**]}]=$JAVA_HOME/bin
fi
