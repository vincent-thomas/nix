{
  networking = {
    hostName = "vt-pc";
    networkmanager.enable = true;
    defaultGateway = "192.168.1.1";
    nameservers = [ "1.1.1.1" ];
    interfaces.wlp4s0.ipv4.addresses = [{
      address = "192.168.1.69";
      prefixLength = 24;
    }];
  };
}
