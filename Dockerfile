FROM tomcat:8
COPY /var/lib/jenkins/workspace/pipeline/target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
