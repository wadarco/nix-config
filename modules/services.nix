{
  services = {
    flatpak.enable = true;
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
