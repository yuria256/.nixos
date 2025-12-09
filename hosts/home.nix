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

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = [ "~/.ssh/id_github" ];
      };
    };
  };

  # ..and Programs go here.
  nixpkgs.config.allowUnfree = true;
  programs = {
    home-manager.enable = true;
    fish.enable = true;
    git = {
      enable = true;
      settings = {
        user.name = "yuria256";
        user.email = "yuria@londor.dev";
      };
    };
  };

  # Yes, I read the comment.
  home.stateVersion = "25.11";
}
