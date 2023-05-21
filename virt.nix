{ config, pkgs, ... }:
{
  virtualisation = {
    # Libvirt for virt-manager
    libvirtd.enable = true;
    # Docker
    docker.enable = true;
  };

}
