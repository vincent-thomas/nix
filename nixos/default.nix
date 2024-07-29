{ pkgs, ... }:
{

  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./networking.nix
    ./locale.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; ???

    #media-session.enable = true; ??
  };

  users.users.vt = {
    isNormalUser = true;
    description = "vincent";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    
    packages = with pkgs; [
      localsend
      todoist
      polkit_gnome
      killall
      fd
    ];
 };

 # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

 system.stateVersion = "24.05";

}
