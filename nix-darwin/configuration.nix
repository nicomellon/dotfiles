{ config, pkgs, inputs, ... }: {

  environment.systemPackages = [
    pkgs.direnv
    pkgs.skhd
    pkgs.starship
    pkgs.tmux
    pkgs.vim
  ];

  services.nix-daemon.enable = true;
  services.skhd.enable = true;

  system.stateVersion = 4;
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
  };
}
