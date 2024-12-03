{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      monaspace
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      wqy_zenhei
      ipafont
      
    ]++ (with nerd-fonts; [fira-code jetbrains-mono hasklug]);

    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        sansSerif = [ "JetBrainsMono Nerd Font Mono" ];
        serif = [ "JetBrainsMono Nerd Font Mono" ];
        emoji = [ "Noto Fonts Emoji" ];
      };
    };

    fontDir.enable = true;
  };
}
