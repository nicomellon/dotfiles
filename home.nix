{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  # home.username = "nm";
  # home.homeDirectory = "/Users/nm";

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
    ".zshrc".source = ./dotfiles/.zshrc;
    ".tmux.conf".source = ./dotfiles/.tmux.conf;
    ".config/wezterm".source = ./dotfiles/wezterm;
    ".config/skhd".source = ./dotfiles/skhd;
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/karabiner".source = ./dotfiles/karabiner;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh.enable = true;
}
