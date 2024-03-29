{ pkgs, ... }:

let
  inherit (builtins) readDir mapAttrs attrValues;
  inherit (pkgs.lib) hasSuffix;
in
rec{
  importModules = dir:
    builtins.concatLists (attrValues (
      mapAttrs
        (file: value:
          if hasSuffix ".nix" file
          then [ "${dir}/${file}" ]
          else if value == "directory"
          then (importModules "${dir}/${file}") else [ ]
        )
        (readDir dir)
    ));
}
