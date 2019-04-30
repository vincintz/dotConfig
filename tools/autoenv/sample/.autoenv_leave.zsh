if [[ -n $ORIG_JAVA_HOME ]]; then
  JAVA_HOME=$ORIG_JAVA_HOME
  path[${path[(i)/opt/java/**]}]=$JAVA_HOME/bin
fi

echo 'Current JAVA_HOME:' $JAVA_HOME
