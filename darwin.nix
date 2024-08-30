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

  nix.settings.experimental-features = "nix-command flakes";

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
    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      "com.apple.keyboard.fnState" = true;
    };
  };
}
