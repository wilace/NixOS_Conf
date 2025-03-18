{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../base-configuration.nix
      ./hardware-configuration.nix
      ./gui-configuration.nix
      ./virtualbox-configuration.nix
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
  networking.hostName = "nyx";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];
}

