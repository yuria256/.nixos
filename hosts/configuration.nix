{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Define User Account, permissions, & set shell.
  users.users.yuria = {
    isNormalUser = true;
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable Networking & define Host Name.
  networking = {
    hostName = "hosidius";
    networkmanager.enable = true;
  };

  # Allow unfree packages & Enable Lix Systems.
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ (final: prev: {
      inherit (prev.lixPackageSets.latest)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena;
        }
      )
    ];
  };

  # Enable Flakes & Use Lix Packages.
  nix = {
    package = pkgs.lixPackageSets.latest.lix;
    settings.experimental-features = [
    "nix-command"
    "flakes"
    ];
  };

  # Gnome knows best.
  services.desktopManager.gnome.enable = true;
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "gnome";
    autoLogin = {
      enable = true;
      user = "yuria";
    };
  };

  # Set your time zone.
  time.timeZone = "Australia/Perth";

  # Music to my ears.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Systemd Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Keep it unfree please.
  programs = {
    firefox.enable = true;
    thunderbird.enable = true;
    steam.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vscodium
    tmux
    neofetch      
    # neovim (Now managed in Flake + Modules)
    neomutt
  ];

  # Hopes & Dreams
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    targets.console.enable = true;
  };

  # QMK & Graphics Drivers.
  hardware = {
    keyboard.qmk.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Yes, I read the comment.
  system.stateVersion = "25.11";
}
