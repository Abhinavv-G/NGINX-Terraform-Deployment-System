# Terraform-Based NGINX Load-Balanced CI/CD Platform

A multi-container infrastructure platform that demonstrates Infrastructure as Code (IaC), container orchestration, load balancing, and CI/CD automation. The platform uses Terraform to provision Docker infrastructure, NGINX as a reverse proxy and load balancer, Flask-based backend services, and Jenkins for automated deployment workflows.


## Architecture

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/3e804885-316f-498d-82b7-2648c01d3e5e" />

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

