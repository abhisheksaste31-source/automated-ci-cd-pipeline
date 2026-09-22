# CI/CD Setup Guide

## Prerequisites

Install or configure:

- Git
- Java
- Maven
- Jenkins
- SonarQube
- Nexus Repository
- AWS S3
- Apache Tomcat

## Jenkins Plugins

The pipeline requires the appropriate Jenkins plugins for:

- Pipeline
- Git
- SonarQube Scanner for Jenkins
- Nexus Artifact Uploader
- AWS S3 Publisher
- Deploy to Container

Plugin names can vary by Jenkins/plugin version.

## Jenkins Credentials

Configure credentials using Jenkins Credentials instead of hard-coding secrets.

Expected credential IDs in the example:

```text
nexus
s3creds
tomcatcred
```

## SonarQube

Configure the Jenkins SonarQube installation with the name:

```text
SonarQube
```

The pipeline uses:

```bash
mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar
```

## Nexus

Configure:

- Nexus host
- Repository
- Credentials
- Group ID
- Artifact ID
- Version

Current application values:

```text
Group ID    : in.reyaz
Artifact ID : myapp
Version     : 8.3.3-SNAPSHOT
Repository  : hotstar1
```

## S3

Configure:

- S3 bucket
- AWS region
- Jenkins AWS credentials/profile

Region used in the example:

```text
ap-south-1
```

## Tomcat

Configure the Tomcat server URL and credentials.

The application context is:

```text
mywebapp
```

## Security

Do not commit infrastructure credentials, passwords, tokens, private keys, or access keys to GitHub.
