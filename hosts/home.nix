{ config, pkgs, programs, ... }:

{
  imports = [ 
    ../modules/stylix.nix
    ../modules/vscodium.nix
    ../modules/firefox.nix
    ../modules/nixvim.nix
    ../modules/nixcord.nix
  ];

  # Packages go here..
  home = {
    username = "yuria";
    homeDirectory = "/home/yuria";
    packages = with pkgs; [
      keychron-udev-rules
      bolt-launcher
      nh
    ];
  };

  # ..and Programs go here.
  nixpkgs.config.allowUnfree = true;
  programs = {
    home-manager.enable = true;
    fish.enable = true;
    git = {
      enable = true;
      settings.user.name = "mod_yuria";
    };
  };

  # Yes, I read the comment.
  home.stateVersion = "25.11";
}
