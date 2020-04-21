node
{
	def mavenHome=tool name: "maven"
	
	stage('git checkout')
	{
		git credentialsId: 'jenkins-ocp', url: 'https://github.com/chanduej/mavenwebapp.git'
	}
	stage('Build Artifacts')
	{
		sh "${mavenHome}/bin/mvn clean package"
	}
  stage('Docker Image Build')
  {
    sh "docker build -t chanduibm/mvnwebapp ."
  }
	stage('Buid In Development')
	{
		sh "openshiftBuild(namespace: 'development', buildConfig: 'myapp', showBuildLogs: 'true')"
	}
	stage('Deploy In Development')
	{
		sh "openshiftDeploy(namespace: 'development', deploymentConfig: 'myapp')"
	  sh "openshiftScale(namespace: 'development', deploymentConfig: 'myapp', replicaCount: '4')"
  }
} 
