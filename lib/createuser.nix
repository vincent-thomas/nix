{ pkgs, ... }: 

{ username, userGroups, isRoot, shell }: 
{
  users.users.${username} = {
    isNormalUser = !isRoot; 
    extraGroups = userGroups;
    shell = pkgs.${shell};
  };
}

#   nixpkgs.lib.nixosSystem {
#   inherit system;
#
#   specialArgs = {inherit inputs user allowed-unfree-packages;};
#   modules = [
#     ../hosts/${hostname}
#     homeManagerModule
#     {
#       home-manager.useGlobalPkgs = true;
#       home-manager.useUserPackages = true;
#       home-manager.users.${user} = import ../users/${user};
#       home-manager.extraSpecialArgs = { inherit inputs user allowed-unfree-packages; };
#       home-manager.backupFileExtension = "backup";
#     }
#   ];
# }
#
#
#
#
# }
