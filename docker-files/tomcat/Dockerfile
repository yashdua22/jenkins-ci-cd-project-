FROM maven:3.9.9 AS build_image
RUN git clone https://github.com/yashdua22/jenkins-ci-cd-project-.git
WORKDIR /jenkins-ci-cd-project
RUN mvn install 

FROM tomcat:10-jdk21-openjdk
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build_image jenkins-ci-cd-project/target/beauty-store.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"] 