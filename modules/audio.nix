{
  security.rtkit.enable = true;

  services.pipewire = {
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    enable = true;
  };
}
