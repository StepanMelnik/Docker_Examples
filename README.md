# Docker examples

The project contains a list of simple Docker scripts to create and run Docker images with detailed instruction in the header of build scripts.  

## Description
The examples based on Docker version 19.03.9 build.

### BuildByMaven.Dockerfile
BuildByMaven.Dockerfile allows to build a Maven project with specified Maven settings if you use Nexus repository locally.

For example, create settings.xml to connect to local Nexus server:

```
  <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  	xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">
	    <mirrors>
			<mirror>
	            <id>repository.sme.com</id>
	            <url>http://repository.sme.com:8081/repository/maven/</url>
	            <mirrorOf>*</mirrorOf>
	        </mirror>
		</mirrors>
	
	    <servers>
	        <server>
	            <id>repository.sme.com</id>
	            <username>developer</username>
	            <password>secret</password>
	        </server>
	    </servers>					  

	</settings>
```

**Build**:
>  sudo docker build --no-cache  -t "docker-example-mvn:0.1" -f BuildByMaven.Dockerfile .

**Run**:
>  sudo docker run docker-example-mvn:0.1 mvn clean install

**More**:
More detailed description see in the header of BuildByMaven.Dockerfile file.

We can use the example to build an artifact of Maven project and continue to deploy the artifact in Docker container.

### RunByJava.Dockerfile
Run "mvn install" to create artifact of Maven project.
 
BuildByJava.Dockerfile works with a created jar artifact.

If you want to create an artifact in Docker file as well, use a scenario in BuildByMaven.Dockerfile.

**Build**:
>  sudo docker build --no-cache  -t "docker-example-java:0.1" -f RunByJava.Dockerfile .

**Run**:
>  sudo docker run docker-example-java:0.1 java -cp docker-examples-java.jar com.sme.docker.examples.Main test1 test2

**More**:
More detailed description see in the header of BuildByMaven.Dockerfile file.

### Spring Boot Dockerfile
See <a href="https://github.com/StepanMelnik/HelloSpringFramework/Dockerfile">Docker</a> script in https://github.com/StepanMelnik/HelloSpringFramework project.
