#main.tf 
#providers
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" { 
  uri= "qemu:///system"
}

# Ubuntu server-22.04

# VM Volume
resource "libvirt_volume" "ubuntu-server-22-04" {
  name = "ubuntu-server-22-04"
  pool = "default" 
  source = "https://cloud-images.ubuntu.com/jammy/20221104/jammy-server-cloudimg-amd64.img"
  format = "img"
}

# KVM domain
resource "libvirt_domain" "ubuntu-server" {
  name   = "ubuntu-server"
  memory = "512"
  vcpu   = 2

  network_interface {
    network_name = "default" 
  }

  disk {
    volume_id = "${libvirt_volume.ubuntu-server-22-04.id}"
  }
  
  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

#fedora

# VM Volume
resource "libvirt_volume" "fedora-qcow2" {
  name = "fedora.qcow2"
  pool = "default"
  #source = "https://download.fedoraproject.org/pub/fedora/linux/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2"
  source=""
  format = "qcow2"
}

# KVM domain 
resource "libvirt_domain" "fedora" {
  name   = "fedora"
  memory = "512"
  vcpu   = 2

  network_interface {
    network_name = "default" 
  }

  disk {
    volume_id = "${libvirt_volume.fedora-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

