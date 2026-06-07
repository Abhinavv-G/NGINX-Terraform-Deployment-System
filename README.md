# NGINX Load-Balanced CI/CD Platform


A DevOps project demonstrating Docker containerization, NGINX load balancing, Docker networking, and CI workflow using Jenkins.


## Tech Stack

- Docker
- NGINX
- Jenkins
- Python Flask

## Features

- Dockerized Flask application
- Multiple backend containers
- NGINX reverse proxy
- Round-robin load balancing
- Docker bridge networking
- Jenkins CI/CD pipeline

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/c10dba65-781c-45e1-bc42-fbf35784423f" />


## Run the Project


docker compose up --build

Open in browser:

http://localhost


## Verify Load Balancing

Refresh the browser multiple times:

http://localhost

Responses alternate between:
- app1
- app2

You can also test using:

curl http://localhost


## Test Internal Container Communication

docker exec -it nginx sh
curl http://app1:5000
curl http://app2:5000

Docker Compose automatically creates a shared bridge network where containers communicate using service names as DNS hostnames.


NGINX routes incoming traffic to backend Flask containers using upstream load balancing and Docker internal networking.




