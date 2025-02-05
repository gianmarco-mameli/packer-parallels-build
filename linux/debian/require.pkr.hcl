packer {
  required_version = ">= 1.9.4"
  required_plugins {
    parallels = {
      version = ">= 1.2.4"
      source  = "github.com/Parallels/parallels"
    }
    vagrant = {
      version = ">= 1.1.5"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}