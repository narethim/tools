# setup-jenkins-container.md

## Install

### Part 1/4 Run Jenkins in Docker Container

Youtube link [Run Jenkins in Docker Container - Jenkins Pipeline Tutorial for Beginners 1/4](https://www.youtube.com/watch?v=pMO26j2OUME)

```sh
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins
```

```sh
docker ps

docker logs <container id>
```

firefox http://localhost:8080

```sh
User: jenkins
Password: ****
Full name: Jenkins
Email: jenkins@gmailcom
```

### Part 2/4 Create Multibranch Pipeline with Git

Youtube link [Create Multibranch Pipeline with Git - Jenkins Pipeline Tutorial for Beginners 2/4](https://www.youtube.com/watch?v=tuxO7ZXplRE&t=2s)

### Part 3/4 Jenkinsfile

Youtube link [Jenkinsfile - Jenkins Pipeline Tutorial for Beginners 3/4](https://www.youtube.com/watch?v=MY1w7sWW5ms)
Jenkinfile

```sh
pipeline {
  agent any

  stages {
    stage("build") {
      steps {
        echo 'building the application ...'
      }
    }

    stage("test") {
      steps {
        echo 'testing the application ...'
      }
    }

    stage("deploy") {
      steps {
        echo 'deploying the application ...'
      }
    }
  }
}
```

### Part 4/4 Trigger Jenkins Build automatically

Youtube link [Trigger Jenkins Build automatically - Jenkins Pipeline Tutorial for Beginners 4/4](https://www.youtube.com/watch?v=CmwTPxdx24Y&t=2s)

Push method: SCM (e.g. GitHub) sends notification when it is committed)

* Webhook

Pull method: Jenkins polls SCM to see if there is any change is committed)

* Using cron type polling

Maybe using both techniques by polling at a lower rate (every 2 hours or so)

### Part 5 Configure Build Tools in Jenkins and Jenkinsfile

[Configure Build Tools in Jenkins and Jenkinsfile | Jenkins Tutorial](https://www.youtube.com/watch?v=L9Ite-1pEU8)

Backend/Java build tools:

* Maven
* Gradle (Install Gradle plugin)

Frontend/Javascript build tools:

* npm  (Install node.js plugin)
* yarn  (Install yarn plugin)

Others

* Ant / Makefile
