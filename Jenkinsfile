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

}  
