#tomcatConvertPath()
#{
#	path=${1##+(/)}
#	if [[ -z $path ]]; then
#		path=ROOT
#	else
#		path=${path%%+(/)}
#		path=${path//+(\/)/#}
#	fi
#	echo "$path"
#}

#tomcatDeploy()
#{
#	tomcatObtainTomcatLock
#	tomcatStop
#	tomcatUndeployWars
#	tomcatParseWarConfig
#	tomcatDeployWars
#	tomcatStart
#	tomcatReleaseTomcatLock
#}

#tomcatDeployWar()
#{
#	juju-log "Deploying war $1"
#	name=$(basename "$1" .war)
#	path=${war_path[$name]}
#	if [[ -n $path ]]; then
#		path=$(tomcatConvertPath "$path")
#	else
#		path=$name
#	fi
#	checkExists "/var/lib/tomcat7/webapps/$path.war" \
#		"/var/lib/tomcat7/webapps/$path"
#	if [[ -d $1 ]]; then
#		cp -r "$1" "/var/lib/tomcat7/webapps/$path"
#	else
#		cp "$1" "/var/lib/tomcat7/webapps/$path.war"
#		unzip -q -d "/var/lib/tomcat7/webapps/$path" \
#			"/var/lib/tomcat7/webapps/$path.war"
#	fi
#	echo -e "$name\t$path" >> "/etc/tomcat7/$SERVICE.wars_deployed"
#}

#tomcatDeployWars()
#{
#	juju-log "Deploying war files for tomcat7"
#	for war in deploy/?*.war; do
#		[[ -s $war ]] || continue
#		tomcatDeployWar "$war"
#	done
#}

tomcatObtainTomcatLock()
{
	(umask 0077; touch /etc/tomcat7/tomcat.lock)
	exec 9> /etc/tomcat7/tomcat.lock; flock 9
}

#tomcatParseWarConfig()
#{
#	unset war_path
#	declare -Ag war_path
#	IFS="," read -a tokens <<<"$(config-get war-config)"
#	for token in "${tokens[@]}"; do
#		IFS=":" read name path other <<<"$token"
#		if [[ -n $name ]]; then
#			war_path[$name]=$path
#		fi
#	done
#}

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

#tomcatUndeployWar()
#{
#	juju-log "Undeploying war $1"
#	rm -rf "/var/lib/tomcat7/webapps/$2" \
#		"/var/lib/tomcat7/webapps/$2.war"
#}

#tomcatUndeployWars()
#{
#	juju-log "Undeploying war files for tomcat7"
#	if [[ -e /etc/tomcat7/$SERVICE.wars_deployed ]]; then
#		while IFS=$'\t' read name path; do
#			tomcatUndeployWar "$name" "$path"
#		done < "/etc/tomcat7/$SERVICE.wars_deployed"
#		rm -f "/etc/tomcat7/$SERVICE.wars_deployed"
#	fi
#}

