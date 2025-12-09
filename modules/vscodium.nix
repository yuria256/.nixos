{ programs, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
      ];
    };
  };
}