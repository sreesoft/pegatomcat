
## Basic CPU & Heap settings are here ####
JAVA_OPTS="$JAVA_OPTS -Xms4096M -Xmx8192M -XX:MaxMetaspaceSize=768M"
#JAVA_OPTS="$JAVA_OPTS -XX:PermSize=512m -XX:MaxPermSize=1024m"


## GC Logs & Other GC Settings are here ####
## GC log setting for JDK-11
#JAVA_OPTS="$JAVA_OPTS -Xlog:gc*:/pega/logs/gc_%t.log:time:filecount=50,filesize=5M"

## GC log setting for JDK-8
JAVA_OPTS="$JAVA_OPTS -verbose:gc -Xloggc:/pega/logs/gc_%t.log"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=50 -XX:GCLogFileSize=5M"
#JAVA_OPTS="$JAVA_OPTS -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
#JAVA_OPTS="$JAVA_OPTS -XX:TargetSurvivorRatio=90 -XX:+DisableExplicitGC"
#JAVA_OPTS="$JAVA_OPTS -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=80"
#JAVA_OPTS="$JAVA_OPTS -XX:+CMSClassUnloadingEnabled -XX:ReservedCodeCacheSize=512m -XX:+UseCodeCacheFlushing"


## Java Heap settings and what to do when out of memory ####
#JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/pega/logs/heapdump"


## Tomcat & JVM Config Related settings are here #### 
JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"
JAVA_OPTS="$JAVA_OPTS -Duser.timezone=Europe/London"
JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:///dev/urandom"
JAVA_OPTS="$JAVA_OPTS -Dcatalina.logs=/pega/logs"
JAVA_OPTS="$JAVA_OPTS -Xrs"
JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
CATALINA_OUT="/pega/logs/catalina.out"


## Pega config related settings are here ####
JAVA_OPTS="$JAVA_OPTS -Duser.home=/pega/config"
JAVA_OPTS="$JAVA_OPTS -Dpega.tmpdir=/pega/temp"
JAVA_OPTS="$JAVA_OPTS -Dpega.logdir=/pega/logs"
JAVA_OPTS="$JAVA_OPTS -Dpega.config=/pega/config/prconfig.xml"
JAVA_OPTS="$JAVA_OPTS -Dpegarules.logging.configuration=/pega/config/prlog4j2.xml"
JAVA_OPTS="$JAVA_OPTS -Dprmbeans.security=/pega/config/prmbeans.properties"
JAVA_OPTS="$JAVA_OPTS -Dcom.pega.sma.tmpdir=/pega/config"
JAVA_OPTS="$JAVA_OPTS -DNodeType=Universal"
JAVA_OPTS="$JAVA_OPTS -Dpega.logdir=/pega/logs"


## Any other settings to go? ####
UMASK="022"

