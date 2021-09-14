# The name of your project. A project typically maps 1:1 to a VCS repository.
# This name must be unique for your Waypoint server. If you're running in
# local mode, this must be unique to your machine.
project = "collector-example"

runner {
  enabled = true
  data_source "git" {
    url = "https://github.com/ereborstudios/flappy-coin-collector.git"
    ref = "main"
  }
}

# Labels can be specified for organizational purposes.
# labels = { "foo" = "bar" }

# An application to deploy.
app "collector-example" {

  config {
    env = {
    }
  }

  labels = {
    "service" = var.name
  }

  # Build specifies how an application should be deployed. In this case,
  # we'll build using a Dockerfile and keeping it in a local registry.
  build {
    use "docker" {
    }
  }

  # Deploy to Docker
  deploy {
    use "docker" {
      labels = {
        "traefik.http.routers.${var.name}.rule" = "Host(`${var.name}.waypoint.smaug.dev`)"
        "traefik.http.routers.${var.name}.entrypoints" = "websecure"
        "traefik.http.routers.${var.name}.tls.certresolver" = "myresolver"
        "traefik.http.services.${var.name}.loadbalancer.server.port" = "3000"
      }
    }
  }
}

variable "name" {
  type = string
  default = "collector-example"
  description = "Project name"
}
