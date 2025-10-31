# **TASK 8: Run a Simple Java Maven Build Job in Jenkins**
* Objective

This project demonstrates how to use Jenkins to automate the build of a simple Java application using Maven through a Declarative Pipeline. It serves as a foundational step toward implementing Continuous Integration and Continuous Delivery for Java-based applications.

* Tools and Technologies Used

Amazon EC2 Instances (Master and Agent)
Jenkins
Java JDK 11
Maven
Docker
Git

* EC2 Architecture

The project uses a two-node setup:

Master Node: Runs Jenkins and manages pipeline orchestration.

Agent Node: Executes the build stages and handles code compilation.

The master node was configured using jenkins-master.sh to install Jenkins and Java, while the agent node was set up using jenkins-agent.sh to install Java, Maven, and Docker and to connect it with the Jenkins master.

* Jenkins Pipeline Overview
The pipeline automates the following tasks:
Reads the version from the Maven POM file.
Builds and packages the Java application using Maven.
Displays build status messages upon completion.
Cleans up the workspace after every run.
The pipeline also includes options to prevent concurrent builds, apply build timeouts, and use colorized output for better readability.

* Features

Fully automated Jenkins Declarative Pipeline
Version extraction from pom.xml
Maven-based Java build and packaging
Master–Agent Jenkins configuration on EC2
Post-build success and failure handling
Clean workspace after each execution

* Deliverables

Working Jenkins pipeline building a Java HelloWorld application
Successful build output in Jenkins console
Generated JAR file in the target directory
Verified communication between Jenkins master and agent

    