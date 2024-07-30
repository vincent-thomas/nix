{ pkgs, allowed-unfree-packages, lib, ... }:
{
  system.stateVersion = "24.05";

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) allowed-unfree-packages;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  security.rtkit.enable = true;

  imports = [
    ./hardware.nix

    ./audio.nix
    ./graphics.nix
  ];

  networking = {
    hostName = "vt-pc";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
  };

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  programs.zsh.enable = true;
  users.users.vt = {
    isNormalUser = true;
    description = "vincent";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
 };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  environment.systemPackages = [
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;


 #  services.printing.enable = true;

 # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
