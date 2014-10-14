tomcatObtainTomcatLock()
{
	(umask 0077; touch /etc/tomcat7/tomcat.lock)
	exec 9> /etc/tomcat7/tomcat.lock; flock 9
}

tomcatReleaseTomcatLock()
{
	exec 9>&-
}

tomcatStart()
{
	if ! service tomcat7 status > /dev/null; then
		juju-log "Starting tomcat7"
		service tomcat7 start
	fi
}

tomcatStop()
{
	if service tomcat7 status > /dev/null; then
		juju-log "Stopping tomcat7"
		service tomcat7 stop
	fi
}
