{ config, lib, pkgs, ... }:

{
  # Select nixpkgs version.
  system.stateVersion = "24.11";

  # Enable nix-command and nix-flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set time zone
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "jp106";
    useXkbConfig = false;
  };

  # Enable soud.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable ssh.
  services.openssh.enable = true;



  # Enable zsh
  programs.zsh.enable = true;
}