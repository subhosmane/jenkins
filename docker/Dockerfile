#https://github.com/jenkinsci/docker/blob/master/README.md
ARG JENKINS_VERSION=2.229
FROM jenkins/jenkins:$JENKINS_VERSION

# ENV JENKINS_UC https://updates.jenkins.io
# ENV JENKINS_UC_EXPERIMENTAL https://updates.jenkins.io/experimental
# ENV JENKINS_INCREMENTALS_REPO_MIRROR https://repo.jenkins-ci.org/incrementals
# ENV JENKINS_UC_DOWNLOAD $JENKINS_UC/download
# ENV JENKINS_SLAVE_AGENT_PORT 50001
# ENV JENKINS_HOME /var/jenkins_home
# #ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
# ENV REF /usr/share/jenkins/ref/plugins
# ENV JENKINS_WAR /usr/share/jenkins/jenkins.war
# ENV CURL_OPTIONS -sSfL
# ENV CURL_CONNECTION_TIMEOUT 20
# ENV CURL_RETRY 3
# ENV CURL_RETRY_DELAY 0
# ENV CURL_RETRY_MAX_TIME 60
# COPY https.pem /var/lib/jenkins/cert
# COPY https.key /var/lib/jenkins/pk


COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY scripts/jenkins.sh /usr/local/bin/jenkins.sh
USER root
RUN chmod +x  /usr/local/bin/jenkins.sh 
USER jenkins

#COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy

RUN  /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt 

#RUN cp /usr/share/jenkins/ref/config.xml /usr/share/jenkins/ref/config.xml.override
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
