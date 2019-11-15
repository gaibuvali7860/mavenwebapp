FROM centos

	MAINTAINER	chandu.dsml@gmail.com
	RUN mkdir /opt/tomcat
	
	RUN curl -O http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
	RUN tar -xvf apache-tomcat-9.0.27.tar.gz
	RUN mv apache-tomcat-9.0.27/* /opt/tomcat/.
	
	RUN yum install -y java
	RUN java -version
	
	WORKDIR /opt/tomcat/webapps/
	
	CMD ["/opt/tomcat/bin/catalina.sh", "run"]
	
	COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
