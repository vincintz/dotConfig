if [[ -n $ORIG_JAVA_HOME ]]; then
  path[${path[(i)$JAVA_HOME/**]}]=$ORIG_JAVA_HOME/bin
  JAVA_HOME=$ORIG_JAVA_HOME
fi

echo 'Current JAVA_HOME:' $JAVA_HOME
