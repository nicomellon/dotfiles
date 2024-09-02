{ config, pkgs, ... }:

{
  home.username = "nm";
  home.homeDirectory = "/Users/nm";
  home.stateVersion = "24.05";

  home.file = {
    ".config/aerospace".source = ../aerospace;
    ".config/karabiner".source = ../karabiner;
    ".config/nvim".source = ../nvim;
    ".config/tmux".source = ../tmux;
    ".config/skhd".source = ../skhd;
    ".config/wezterm".source = ../wezterm;
    ".password-store".source = ../password-store;
  };

  programs.git.enable = true;
  programs.git.userEmail = "nmellon94@gmail.com";
  programs.git.userName = "nicomellon";

  programs.gpg.enable = true;
  programs.gpg.publicKeys = [
    {
      source = ../keys/public.gpg;
      trust = 5;
    }
  ];

  programs.home-manager.enable = true;

  programs.starship.enable = true;

  programs.zsh.enable = true;
}
