{ lib, pkgs, ... }:

{
  i18n = lib.mkForce {
    defaultLocale = "ja_JP.UTF-8";

    inputMethod = {
      enable = true;

      type = "fcitx5";
      fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-gtk ];
    };
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      source-han-code-jp
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif CJK JP" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans CJK JP" "Noto Color Emoji" ];
      monospace = [ "Source Han Code JP" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
    fontDir.enable = true;
  };

  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xkb = {
      layout = "jp";
      model = "pc106";
    };
  };
  console.useXkbConfig = lib.mkForce true;
}
