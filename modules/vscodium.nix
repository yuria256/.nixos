{ programs, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      userSettings = {
        "workbench.colorTheme" = "Rosé Pine Moon";
      };
      extensions = with pkgs.vscode-extensions; [
        mvllow.rose-pine
        jnoortheen.nix-ide
      ];
    };
  };
}