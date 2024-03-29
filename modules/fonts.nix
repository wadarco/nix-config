{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      monaspace
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      # noto-fonts-cjk-sans
      wqy_zenhei
      ipafont
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Hasklig" "Mononoki" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "FiraCode Nerd Font Mono" ];
        sansSerif = [ "FiraCode Nerd Font" ];
        serif = [ "FiraCode Nerd Font" ];
        emoji = [ "Noto Fonts Emoji" ];
      };
    };

    fontDir.enable = true;

  };
}
