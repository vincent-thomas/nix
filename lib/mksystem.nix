# # This function creates a NixOS system based on our VM setup for a
# # particular architecture.
# { nixpkgs, inputs }:
#
# name:
# {
#   system,
#   user,
# }:
#
# let
#
#   userOSConfig = import ../hosts/${user} {inputs = inputs;};
#   userHMConfig =  import ../users/${user} {inputs = inputs;};
#
#   systemFunc = nixpkgs.lib.nixosSystem;
#   home-manager = inputs.home-manager.nixosModules;
#
#   nixOSConfig = {
#     users.users.${user} = {
#       isNormalUser = true;
#       extraGroups = [ "networkmanager" "wheel" ];
#       shell = nixpkgs.legacyPackages.${system}.zsh;
#     };
#   };
#   # hmConfig = {
#   #   home.stateVersion = "23.11";
#   #   home.username = user;
#   #   home.homeDirectory = "/home/${user}";
#   #
#   #   nixpkgs.config.allowUnfree = true;
#   #   programs.home-manager.enable = true;
#   # };
#
# in systemFunc {
#   inherit system;
#
#   modules = [
#     # { nixpkgs.overlays = overlays; }
#
#     (userOSConfig // nixOSConfig)
#     home-manager.home-manager {
#       home-manager.useGlobalPkgs = true;
#       home-manager.useUserPackages = true;
#       home-manager.users.${user} = userHMConfig/*  // hmConfig */;/*  // {
#           modules = userHMConfig.modules ++ [
#             inputs.catppuccin.homeManagerModules.catppuccin
#           ];
#         }; */
#     }
#   ];
# }
