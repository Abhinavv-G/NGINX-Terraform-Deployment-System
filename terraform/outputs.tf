output "application_url" {
  value = "http://localhost"
}

output "load_balancer" {
  value = docker_container.nginx.name
}

output "backend_containers" {
  value = [
    docker_container.app1.name,
    docker_container.app2.name
  ]
}