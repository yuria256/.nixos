{ pkgs, lib, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    enableReleaseChecks = false;

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/rose-pine/wallpapers/refs/heads/main/moon.jpg";
      hash = "sha256-2IjX3M6toTdAxyK6bBnqlAp10yVgHjZYarV39kP+t0s=";
    };
    cursor = {
      size = 28;
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;  
    };

    targets = {
      firefox.firefoxGnomeTheme.enable = true;
      firefox.profileNames = [ "default" ];
      neovim.plugin = "base16-nvim";
    };
  };
}
