if [[ "$(stat -c "%U" $JENKINS_HOME)" != "jenkins" ]]
then
    echo "Changing directory $JENKINS_HOME ownership to jenkins"
    chown jenkins:jenkins $JENKINS_HOME
fi

echo "Forcing Jenkins user."
exec /usr/local/bin/jenkins.sh "$@"