{ programs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    policies = {
      DisableTelemetry = true;
      DisableAccounts = true;
      DisplayBookmarksToolbar = "always";

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4629131/ublock_origin-1.68.0.xpi";
          installation_mode = "force_installed";
        };
        "tab-stash@condordes.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4481624/tab_stash-3.3.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4633659/bitwarden_password_manager-2025.11.2.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
