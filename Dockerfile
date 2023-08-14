FROM jenkins/jenkins:2.401.3-jdk17

USER root

RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | gpg --dearmor \
  -o /usr/share/keyrings/jenkins-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] \
  https://pkg.jenkins.io/debian binary/" | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

RUN apt-get update && apt-get install -y jenkins

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

