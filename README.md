# **MySQL_Nodejs_Application-Deployment**

# **Dockerized Node.js App Deployment on AWS with CI/CD**

## **Objective**
Dockerize a simple Node.js app, deploy it on an AWS EC2 instance, interact with a MySQL database on AWS RDS, and set up a CI/CD pipeline using either AWS CodePipeline or Jenkins. Infrastructure provisioning on AWS is done using Terraform.

## **Solution Overview**
- **GitHub Repository**: [mysql-nodejs-application_deployment](https://github.com/Ravivarman16/mysql-nodejs-application_deployment.git)

## **Architecture Diagram**
![OVERVIEW](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/8da842f3-c98d-4e62-b1ab-86767b4bf862)

### **Steps**

1. **IAM User for Terraform:**
   - Create an **IAM user** named **"Terraform"** with necessary **AWS policies for EC2, RDS, and VPC.**

2. **Provision EC2 Instance for Terraform:**
   - **Clone the GitHub repository:**
     ```bash
     git clone https://github.com/Ravivarman16/mysql-nodejs-application_deployment.git
     ```
     **Move inside the repository:**
     ```bash
     cd mysql-nodejs-application_deployment
     ```
     **Configure AWS credentials, and run the following commands for Terraform:**
     ```bash
     terraform init
     terraform fmt
     terraform validate
     terraform plan
     terraform apply -auto-approve
     ```

 ### **Terraform Output:**

 #### **Security Groups**

 ##### **Testing Instance Security Group (TESTING INSTANCE SC)**
 | **Rules**                    | **Port Number** |
 | -------------------------- | ----------- |
 | **HTTP**                       | 80          |
 | **SSH**                        | 22          |
 | **Jenkins & Application**      | 8080        |
 | **Database**                   | 3306        |

 ##### **Deployment Instance Security Group (DEPLOYMENT INSTANCE SC)**
 | **Rules**                    | **Port Number** |
 | ------------------------ | ----------- |
 | **HTTP**                     | 80          |
 | **SSH**                      | 22          |
 | **Grafana**                  | 3000        |
 | **Prometheus**               | 9090        |
 | **Docker – daemon**          | 9323        |
 | **Node-exporter**            | 9100        |

 #### **Instances**

 ##### **Testing Instance**
 - **Instance Type:** t2.small
 - **OS:** Ubuntu
 - **Security Group:** TESTING INSTANCE SC
 - **Services and Packages Installed:**
   - Nodejs
   - Docker
   - Jenkins
   - MySQL

 ##### **Deployment Instance**
 - **Instance Type:** t2.micro
 - **OS:** Ubuntu
 - **Security Group:** DEPLOYMENT INSTANCE SC
 - **Services and Packages Installed:**
   - Docker
   - Node-exporter
   - Grafana
   - Prometheus

 #### **Database: MySQL RDS Database**
 - **Database Name:** nodejs
 - **Database Endpoint:** nodejs-db.chttjdyzo3c7.us-east-2.rds.amazonaws.com
 - **User:** admin


**4. Test the Application Locally:**
   - Connect to the testing instance, set up the MySQL database, and test the Node.js application.

**5. Dockerize the Application:**
   - Write a Dockerfile, build a Docker image, and run a Docker container for the Node.js app.

**6. Jenkins Setup:**
   - Set up Jenkins on the testing instance, configure DockerHub, GitHub, and SSH credentials.

**7. CI/CD Pipeline:**
   - Create a Jenkinsfile for CI/CD pipeline, trigger builds on GitHub webhook, and deploy the app using SSH.

**8. Monitoring with Prometheus & Grafana:**
   - Configure Prometheus to collect Docker metrics, set up Grafana, and create dashboards for monitoring.

**9. Optional: CloudWatch Setup:**
   - Set up CloudWatch dashboards and alarms for additional monitoring and alerting.

**10. Documentation:**
    - Provide a detailed README in the GitHub repo with setup instructions, workflow diagram, and any challenges faced during implementation.

## **Conclusion**
The solution includes Dockerization, AWS infrastructure provisioning with Terraform, CI/CD pipeline with Jenkins, and monitoring using Prometheus and Grafana. Optional CloudWatch integration is also demonstrated. The detailed steps and configurations are available in the GitHub repository.
