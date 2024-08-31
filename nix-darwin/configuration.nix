{ config, pkgs, inputs, ... }: {

  environment.systemPackages = [
    pkgs.direnv
    pkgs.neovim
    pkgs.skhd
    pkgs.tmux
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  # Enable nix-darwin to manage installing/updating/upgrading Homebrew taps, formulae, and casks.
  # NOTE: enabling this option does not install Homebrew, see the Homebrew website for installation instructions.
  homebrew.enable = true;
  homebrew.casks = [
    "google-chrome"
  ];

  programs.zsh.enable = true;

  # Enable sudo authentication with Touch ID.
  # NOTE: macOS resets this file when doing a system update. As such, sudo authentication with Touch ID
  # won’t work after a system update until the nix-darwin configuration is reapplied.
  security.pam.enableSudoTouchIdAuth = true;

  services.nix-daemon.enable = true;
  services.skhd.enable = true;

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        mru-spaces = false;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv"; # set list view as default
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      trackpad = {
        Clicking = true; # tap to click
        TrackpadThreeFingerDrag = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

}
