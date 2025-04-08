Reverse IP Web Application

Overview

This repository contains the source code, Helm chart, and CI/CD pipeline for deploying a web application that prints the public IP address of any incoming request in reverse order. Additionally, the application stores the reversed IPs in a database for persistence.

Key Features:

- Reverse the public IP of any incoming request.
- Store reversed IPs in a database (e.g., PostgreSQL).
- Dockerized application for easy deployment.
- Helm chart for Kubernetes deployment.
- CI/CD pipeline to automate the build and deployment process.



Prerequisites

1. Tools Required:

   - [Docker](https://www.docker.com/)
   - [Helm](https://helm.sh/)
   - [Kubectl](https://kubernetes.io/docs/tasks/tools/)
   - [Git](https://git-scm.com/)
   - [Google Cloud SDK](https://cloud.google.com/sdk) (for GKE deployment)

2. Environment Setup:

   - Kubernetes cluster (e.g., GKE).
   - Docker Hub or another container registry.
   - Database instance (e.g., PostgreSQL) accessible by the application.


Application Architecture

Components:

1. Backend Application:

   - Written in Python (Flask framework).
   - Handles incoming HTTP requests and reverses the client IP address.
   - Stores reversed IPs in a PostgreSQL database.

2. Database:

   - PostgreSQL is used to store reversed IPs.

3. Kubernetes Deployment:

   - Deployment managed via Helm chart.
   - Service exposed using LoadBalancer for external access.

4. CI/CD Pipeline:

   - GitHub Actions pipeline to build, push Docker images, and deploy to Kubernetes.


Setup Instructions

1. Clone the Repository

bash
git clone <repository_url>
cd reverse-ip-chart


2. Build and Push Docker Image

bash
docker build -t <dockerhub_username>/reverse-ip-app:latest .
docker push <dockerhub_username>/reverse-ip-app:latest


### 3. Configure Helm Values

Edit the `values.yaml` file in the `helm/reverse-ip-chart` directory:

yaml
image:
  repository: <dockerhub_username>/reverse-ip-app
  tag: latest

postgresql:
  enabled: true
  auth:
    username: reverse_ip_user
    password: securepassword
    database: reverse_ip_db

service:
  type: LoadBalancer
  port: 8080


4. Deploy to Kubernetes

bash
helm install reverse-ip-app ./helm/reverse-ip-chart

Check the deployed services:
bash
kubectl get svc

5. Access the Application

Visit the external IP address of the LoadBalancer service:


http://35.238.209.250:8080



CI/CD Pipeline

GitHub Actions Workflow

The repository includes a GitHub Actions workflow (`.github/workflows/cicd.yml`) that automates:

1. Building the Docker image.
2. Pushing the image to Docker Hub.
3. Deploying the Helm chart to the Kubernetes cluster.

Trigger the Pipeline

Push changes to the `main` branch to trigger the CI/CD pipeline.


Testing the Application

Check Reverse IP Functionality

1. Use `curl`:

   bash
   curl http://35.238.209.250:8080
   

   The response will be the reverse of your public IP.

2. Access via Browser: Open the URL `http://35.238.209.250:8080` in your browser.



Repository Structure

plaintext
.
├── app/                          # Source code for the application
├── helm/reverse-ip-chart/        # Helm chart for Kubernetes deployment
├── Dockerfile                    # Dockerfile for building the application image
├── requirements.txt              # Python dependencies
├── .github/workflows/cicd.yml    # CI/CD pipeline definition
└── README.md                     # Project documentation



Improvements and Next Steps

- Add unit and integration tests.
- Enable HTTPS for secure communication.
- Implement rate limiting to handle abuse.
- Extend CI/CD pipeline to include security scans.


Contact

For any questions or suggestions, please contact:

- Name: Saiteja Guttikonda
- Email: guttikondasaiteja09@gmail.com
- GitHub: https://github.com/guttikondasaiteja/reverse-ip/

