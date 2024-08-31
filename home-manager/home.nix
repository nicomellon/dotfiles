{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nm";
  home.homeDirectory = "/Users/nm";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  home.file = {
    # ".tmux.conf".source = ../.tmux.conf;
    ".config/karabiner".source = ../karabiner;
    ".config/nvim".source = ../nvim;
    ".password-store".source = ../password-store;
    ".config/skhd".source = ../skhd;
    ".config/wezterm".source = ../wezterm;
  };

  programs.gpg.enable = true;
  programs.gpg.publicKeys = [
    {
      source = ../keys/public.gpg;
      trust = 5;
    }
  ];

  programs.home-manager.enable = true;

  programs.password-store.enable = true;

  programs.starship.enable = true;

  programs.zsh.enable = true;
}
