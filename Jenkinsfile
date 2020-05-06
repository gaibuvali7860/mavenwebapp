node
{
	def mavenHome=tool name: "maven3"
	
	stage('git checkout')
	{
		git credentialsId: 'jenkins-ocp', url: 'https://github.com/chanduej/mavenwebapp.git'
	}
	stage('Build Artifacts')
	{
		sh "${mavenHome}/bin/mvn clean package"
	}
	stage('Code Quality report')
	{
		sh "${mavenHome}/bin/mvn sonar:sonar"
	}
	stage('Push Artifacts to Nexus')
	{
		sh "${mavenHome}/bin/mvn deploy"
	}
  	stage('Docker Image Build')
  	{	
		sh "docker build -t cpolamre/mavenwebapp ."
  	}
	
}
