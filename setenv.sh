JAVA_OPTS="$JAVA_OPTS -Xms4096M -Xmx8192M -XX:MaxMetaspaceSize=768M"
JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:///dev/urandom"
JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true -DNodeType=Universal"
JAVA_OPTS="$JAVA_OPTS -Dcatalina.logs=/pega/logs"
JAVA_OPTS="$JAVA_OPTS -Dpega.logdir=/pega/logs"

UMASK="022"

