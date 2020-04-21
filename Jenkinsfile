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
  	stage('Docker Image Build')
  {		sh "docker build -t cpolamre/mavenwebapp ."
  	}
	stage('Buid In Development')
	{
		openshiftBuild(namespace: 'development', buildConfig: 'myapp', showBuildLogs: 'true')
	}
	stage('Deploy In Development')
	{
		openshiftDeploy(namespace: 'development', deploymentConfig: 'myapp')
	  	openshiftScale(namespace: 'development', deploymentConfig: 'myapp', replicaCount: '4')
  	}
}
