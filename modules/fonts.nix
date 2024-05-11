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
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Hasklig" "Lilex" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Lilix" ];
        sansSerif = [ "Lilix" ];
        serif = [ "Lilix" ];
        emoji = [ "Noto Fonts Emoji" ];
      };
    };

    fontDir.enable = true;
  };
}
