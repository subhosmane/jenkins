build:
	docker build --tag jenkins  .

run: 
	docker run -ti -p 8080:8080 --rm --name jenkins -v /d/docker/volumes/jenkins-bootstrap:/var/jenkins_home jenkins