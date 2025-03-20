{ pkgs, ... }:

{
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
}