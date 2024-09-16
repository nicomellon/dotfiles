{ config, pkgs, ... }:

{
  home.username = "nm";
  home.homeDirectory = "/Users/nm";
  home.stateVersion = "24.05";

  # Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
    pkgs.tmux
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/cheat".source = ../cheat;
    ".config/nvim".source = ../nvim;
    ".config/nix-darwin".source = ../nix-darwin;
    ".config/starship.toml".source = ../starship/starship.toml;
    ".config/tmux".source = ../tmux;
    ".config/wezterm".source = ../wezterm;
  };

  programs.git.enable = true;
  programs.git.userEmail = "nmellon94@gmail.com";
  programs.git.userName = "nicomellon";
  # programs.git.hooks = {
  #   pre-commit = ./pre-commit-script;
  # };

  # programs.gpg.enable = true;
  # programs.gpg.publicKeys = [
  #   {
  #     source = ../keys/public.gpg;
  #     trust = 5;
  #   }
  # ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.fd.enable = true;
  programs.fzf.enable = true;

  programs.starship.enable = true;

  home.sessionVariables = {
  };

  home.sessionPath = [
    "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    initExtra = ''
      # Add any additional configurations here
      export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };
}
