Set-ExecutionPolicy Unrestricted

$version = "2.2"
$swarmURL = "https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$version/swarm-client-$version-jar-with-dependencies.jar"
$swarmClient = "C:\Jenkins\swarm-client-$version.jar"
$masterURL = "127.0.0.1:8080"
$instanceName = ""
$executors = "3"

# Pull swarm client w/ dependecies
Write-Output "Downloading jenkins swarm client "

Start-BitsTransfer -Source $swarmURL -Destination $swamClient

Write-Output "Executing swarm process "

# expect java.exe in the PATH, and use -noCertificateCheck to skip SSL validation
& java -jar $swarmClient -disableSslVerification -labels "Windows" -master $masterURL -name $instanceName -executors $executors
