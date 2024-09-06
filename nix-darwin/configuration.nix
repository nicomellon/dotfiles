{ config, pkgs, inputs, ... }: {

  environment.systemPackages = [
    pkgs.cheat
    pkgs.go
    pkgs.neovim
    pkgs.nodejs_22
    pkgs.pass
    pkgs.pre-commit
    pkgs.python312
    pkgs.ripgrep
    pkgs.skhd
    pkgs.tmux
    pkgs.tree
    pkgs.uv
  ];

  environment.variables = {
    EDITOR = "nvim";
    PASSWORD_STORE_DIR = "$HOME/.password-store";
  };

  # Enable nix-darwin to manage installing/updating/upgrading Homebrew taps, formulae, and casks.
  # NOTE: enabling this option does not install Homebrew, see the Homebrew website for installation instructions.
  homebrew.enable = true;
  homebrew.brews = [ ];
  homebrew.casks = [
    "nikitabobko/tap/aerospace"
    "alfred"
    "docker"
    "gather"
    "google-chrome"
    "karabiner-elements"
    "obsidian"
    "slack"
    "wezterm"
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
