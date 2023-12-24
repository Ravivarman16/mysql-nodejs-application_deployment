# Deployment of Node.js application with a MySQL database, incorporating a CI/CD pipeline on AWS using Terraform 

**Project Overview**

This project involves Dockerizing a Node.js app, deploying it on an AWS EC2 instance with an RDS MySQL database, and setting up a CI/CD pipeline using either AWS CodePipeline or Jenkins. The infrastructure is provisioned using Terraform, and monitoring is implemented with Prometheus and Grafana.

**Project Requirements**
- Dockerize a Node.js App
- Set Up AWS Resources (EC2, RDS)
- Deploy Node.js App on EC2
- CI/CD Pipeline (Option: AWS CodePipeline or Jenkins)
- Monitoring with Prometheus & Grafana
- Infrastructure Provisioning with Terraform

**Solution: Architecture Diagram**

![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/713b2d51-041c-49b2-92c4-6f1b5da8d92e)


**Pre-Requirements**
- Cloud: AWS
- IAC: Terraform
- Environment: Node.js
- Containerization: Docker
- CI/CD: Jenkins
- Monitoring: CloudWatch, Prometheus & Grafana
- Version Control: Git & GitHub

**GitHub Repository:** [mysql-nodejs-application_deployment](https://github.com/Ravivarman16/mysql-nodejs-application_deployment.git)

---

# STEPS TO FOLLOW:

## Step 1 – Create an IAM User:
- Create IAM user "Terraform" with the necessary permissions (EC2, RDS, VPC).
- Generate access and secret keys for CLI access.

## Step 2: Create EC2 Instance for Terraform
- Launch an EC2 instance (t2.micro) with Ubuntu.
- Configure user data script to install Terraform and AWS CLI.

## Step 3: Provision Infrastructure with Terraform

- Clone the given repository using the following commands:
  
  ```bash
  git clone https://github.com/Ravivarman16/mysql-nodejs-application_deployment.git 
  cd mysql-nodejs-application_deployment

- Configure AWS credentials for Terraform
Execute the following commands:
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve


