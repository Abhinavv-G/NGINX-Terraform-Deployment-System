terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_network" {
  name = "app-network"
}

resource "docker_image" "flask_app" {
  name = "flask-app:latest"

  build {
    context = "${path.module}/../app"
  }
}

resource "docker_container" "app1" {
  name  = "app1"
  image = docker_image.flask_app.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_container" "app2" {
  name  = "app2"
  image = docker_image.flask_app.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 80
  }

  upload {
    file    = "/etc/nginx/nginx.conf"
    content = file("${path.module}/../nginx/nginx.conf")
  }

  networks_advanced {
    name = docker_network.app_network.name
  }

  depends_on = [
    docker_container.app1,
    docker_container.app2
  ]
}