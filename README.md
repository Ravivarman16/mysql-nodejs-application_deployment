# Deployment of Node.js application with a MySQL database, incorporating a CI/CD pipeline on AWS using Terraform 

### **PROJECT OVERVIEW**

This project involves Dockerizing a Node.js app, deploying it on an AWS EC2 instance with an RDS MySQL database, and setting up a CI/CD pipeline using either AWS CodePipeline or Jenkins. The infrastructure is provisioned using Terraform, and monitoring is implemented with Prometheus and Grafana.

### **PROJECT REQUIREMENTS**

- Dockerize a Node.js App

  
- Set Up AWS Resources (EC2, RDS)
- Deploy Node.js App on EC2
- CI/CD Pipeline (Option: AWS CodePipeline or Jenkins)
- Monitoring with Prometheus & Grafana
- Infrastructure Provisioning with Terraform

### **SOLUTION: ARCHITECTURE DIAGRAM**

![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/ca2397c6-ffa0-4bd5-bddb-75727302e7ae)



### **PRE-REQUIREMENTS**

- Cloud: AWS

  
- IAC: Terraform
- Environment: Node.js
- Containerization: Docker
- CI/CD: Jenkins
- Monitoring: CloudWatch, Prometheus & Grafana
- Version Control: Git & GitHub


### **GitHub Repository:** [mysql-nodejs-application_deployment](https://github.com/Ravivarman16/mysql-nodejs-application_deployment.git)

---

## STEPS TO FOLLOW:

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

- Configure AWS credentials for Terraform and Execute the following commands:
  ```bash
  terraform init
  terraform fmt
  terraform validate
  terraform plan
  terraform apply -auto-approve


## Step 4: Test the Application Locally

- Connect to the testing instance:

    ```bash
    mysql -u admin -p nodejs -h <database endpoint>
    ```

- **Create the table** by executing the script `t_user.sql`:

    ```bash
    use nodejs;
    ```

    Copy and paste the code from `t_user.sql`.

- **Modify the application code** in `app.js` & `routes/index.js` for the database connection, including the database details.

- **Install dependencies and run the Node.js app** locally:

    ```bash
    npm install 
    node app.js
    ```

- The application will run on port number 8080. Open your browser and navigate to:

    ```bash
    Public IP address:8080
    ```

Replace `<database endpoint>` with the actual MySQL RDS database endpoint.

Note: Ensure firewall rules and security groups allow access from the testing instance to the MySQL RDS database.


## Step 5: Dockerize the Application

- **Create the Docker image for the application** using the command:

    ```bash
    docker build -t <image name> .
    ```

- **To see the Docker image**, use the command:

    ```bash
    docker images
    ```

- **Run the container** using the created image with the command:

    ```bash
    docker run -d -it --name nodejs -p 80:8080 <image name>
    ```

- **To check whether the container is running**, use the command:

    ```bash
    docker ps
    ```

- **Copy and paste the public IP address** of the testing instance in the browser:

    ```bash
    Public IP:80
    ```

Make sure to replace `<image name>` with the desired name for your Docker image.

Note: Ensure that the necessary firewall rules and security groups are configured to allow traffic on port 80 to access the application.



## Step 6: Set Up Jenkins

- Copy and paste the public IP address of the testing instance into the browser with port number 8080:

    ```bash
    Public IP:8080
    ```

- Set up Jenkins.


## Step 7: Set Up DockerHub, GitHub & SSH Credentials in Jenkins

- Add DockerHub credentials in Jenkins.
  
- Add GitHub and SSH credentials for deployment.

## Step 8: Set Up SSH Connection

- Download SSH and SSH Agent plugins in Jenkins.
  
- Configure SSH credentials for connecting to the deployment instance in **"Manage Jenkins," navigate to "System Configuration."**

## Step 9: Create CI/CD Pipeline in Jenkins

- Configure **GitHub webhook** for **automatic triggering.**
  
- Create a **Jenkins pipeline** job linked to the GitHub repository.
- Test the pipeline by triggering a build.
- See the output by copying the **public IP address of the deployment instance** into the browser.
  
   - Public IP Address: **`http://<public_ip_address>:80`**
- Check the application to ensure it is working fine.


### Step 10: Set Up Monitoring with Prometheus & Grafana

- Configure Docker daemon to export metrics by creating `daemon.json` in `/etc/docker/daemon.json` location.

    ```json
    {
      "metrics-addr": "0.0.0.0:9323",
      "experimental": true
    }
    ```

- After adding the above lines, restart Docker using the following command:

    ```
    service docker restart
    ```


- Add **Docker metrics and Node-Exporter to Prometheus yaml file** in `/etc/prometheus/prometheus.yaml`.

    ```yaml
    - job_name: "Docker-container"
      static_configs:
        - targets: ["localhost:9323"]

    - job_name: 'node_exporter'
      scrape_interval: 5s
      static_configs:
        - targets: ['localhost:9100']
    ```

- After adding the above lines, restart the Prometheus service using the following command:

    ```
    service prometheus restart
    ```


- Copy the public IP address of the deployment instance and paste it in the browser with the port number 9090.

    ```
    Public IP address:9090
    ```

- In the Prometheus web interface, navigate to "Status" and check whether all targets are up and running properly.

- To connect to the Grafana server, copy the public IP address of the deployment instance and paste it in the browser with the port number 3000.

    ```
    Public IP address:3000
    ```

- Connect Grafana with Prometheus by adding Prometheus as a datasource.

- Create dashboards in Grafana for monitoring containers and custom metrics.

- Dashboard output like this:

![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/8666758a-bba6-4761-a81b-2697893ff861)


![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/2967775d-9d33-4c45-a0eb-7b4e27ba95ef)



### Step 11: Set Up Monitoring & Alerting through CloudWatch (Optional)

- Create CloudWatch dashboards for EC2 metrics.

- Set up CloudWatch alarms for alerting based on metric thresholds.


![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/c0b2253d-24b9-4ca6-a354-082c5159435e)


# APPLICATION OUTPUT

![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/068431e0-470e-4299-9607-8590329fa708)


![image](https://github.com/Ravivarman16/mysql-nodejs-application_deployment/assets/129171351/221b7222-2632-4fa7-84e1-17815d597021)


# Task Instructions Recap:

All the steps for this task have been provided in this document 
