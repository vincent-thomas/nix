{pkgs, ...}: 
{
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
    
    packages = with pkgs; [
      killall
      fd
    ];
 };
}
