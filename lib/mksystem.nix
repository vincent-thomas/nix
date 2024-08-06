{ nixpkgs, inputs, allowed-unfree-packages }:

hostname:
{
  system,
  user,
}:

let

  homeManagerModule = inputs.home-manager.nixosModules.home-manager;

in nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {inherit inputs user allowed-unfree-packages;};
  modules = [
    ../hosts/${hostname}
    inputs.catppuccin.nixosModules.catppuccin
    homeManagerModule
    {
      networking.hostName = hostname;

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import ../users/${user};
      home-manager.extraSpecialArgs = { inherit inputs user allowed-unfree-packages; };
      # home-manager.backupFileExtension = "backup";
    }
  ];
}
