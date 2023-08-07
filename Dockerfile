FROM redhat/ubi8
MAINTAINER nandu
RUN yum install java-17-openjdk -y
RUN yum install wget -y && yum install git -y
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
RUN tar -xvzf apache-maven-3.9.4-bin.tar.gz
RUN mv apache-maven-3.9.4 /maven9
ENV  MAVEN_HOME=/maven9
ENV PATH=/maven9/bin/:$PATH
RUN echo "export MAVEN_HOME=/maven9" >> /root/.bashrc && echo "export PATH=/maven9/bin/:\$PATH" >> /root/.bashrc
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
