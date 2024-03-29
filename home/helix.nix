{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs;[
      emmet-ls
      lua-language-server
      nil
      vscode-langservers-extracted
      nodePackages_latest.typescript-language-server
    ];
  };
}
