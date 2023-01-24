# On détermine la version du provider OpenStack à utiliser

terraform {
  required_providers {
    openstack = {
      source = "terraform-providers/openstack"
    }
  }
  required_version = ">= 1.0.0"
  backend "http" {
    address = "https://terraform-backend.edu.artheriom.fr/votre_identifiant_ldap"
  }
}



# On demande à Terraform d'utiliser le provider téléchargé à l'instant

provider "openstack" {
  cloud = "minh application"
}
