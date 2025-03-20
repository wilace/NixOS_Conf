{ lib, pkgs, ... }:
let
  config-dir = ../config;
in
{
  imports =
    [ # Include the results of the hardware scan.
      (config-dir + "/base-configuration.nix")
      (config-dir + "/display-server/x11.nix")
      (config-dir + "/i18n.nix")
      (config-dir + "/font.nix")
      (config-dir + "/sound.nix")
      ./hardware-configuration.nix
    ];

  # Define a user account.
  users.users.wilace = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define hostname.
  networking.hostName = "vm"; # virtual-machine

  # Enable desktop manager
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}

