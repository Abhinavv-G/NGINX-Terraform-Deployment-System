# Terraform-Based NGINX Load-Balanced CI/CD Platform

A multi-container infrastructure platform that demonstrates Infrastructure as Code (IaC), container orchestration, load balancing, and CI/CD automation. The platform uses Terraform to provision Docker infrastructure, NGINX as a reverse proxy and load balancer, Flask-based backend services, and Jenkins for automated deployment workflows.


## Architecture

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/a0ef2b5a-bd7c-4f0f-96da-3f89417fcbc5" />


---

## Features

* Infrastructure provisioning using Terraform and Docker Provider
* Multi-container application deployment
* NGINX reverse proxy configuration
* Round Robin load balancing across Flask backend containers
* Custom Docker networking with service discovery
* Automated deployment through Jenkins CI/CD pipelines
* Declarative Infrastructure as Code (IaC)
* Terraform state management and lifecycle control

---

## Tech Stack

| Category               | Technologies          |
| ---------------------- | --------------------- |
| Infrastructure as Code | Terraform             |
| CI/CD                  | Jenkins, GitHub       |
| Containerization       | Docker                |
| Load Balancing         | NGINX                 |
| Backend Services       | Python Flask          |
| Networking             | Docker Bridge Network |



## Terraform Resources

The following infrastructure components are provisioned through Terraform:

* Docker Network (`app-network`)
* Flask Application Image
* NGINX Image
* Flask Backend Container 1 (`app1`)
* Flask Backend Container 2 (`app2`)
* NGINX Load Balancer Container


## Jenkins Pipeline Stages

```text
Clone Repository
        │
        ▼
Terraform Init
        │
        ▼
Terraform Validate
        │
        ▼
Terraform Plan
        │
        ▼
Terraform Apply
```


## Verification

After deployment:

```bash
terraform output
```

Output:

```text
application_url = "http://localhost"
backend_containers = [
  "app1",
  "app2"
]
load_balancer = "nginx"
```

Access:

```text
http://localhost
```

Refreshing the page routes requests between backend containers through NGINX Round Robin load balancing.

