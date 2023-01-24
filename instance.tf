resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "375ed21c-0c1e-45b8-8c83-a5556adcfff9"
  flavor_name       = "v1.m1.d10"
  security_groups = ["default",openstack_networking_secgroup_v2.secgroup_1.name]
  user_data = file("./conf.yml")
  metadata = {
    this = "that"
  }
  network {
    name = openstack_networking_network_v2.network.name
  }
}

resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "public"  
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.basic.id}"

}

resource "openstack_blockstorage_volume_v2" "volume_1" {
  name = "volume_1"
  size = 1
}
resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.basic.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.volume_1.id}"
}


