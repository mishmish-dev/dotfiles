{ config, pkgs, nix-doom-emacs, ... }:

{
  home.username = "mishmish";
  home.homeDirectory = "/home/mishmish";

  home.packages = with pkgs; [
    htop
    fortune
    google-chrome
    git
    vscodium
    neovim
    unzip
    rclone
    docker-compose
    jetbrains.pycharm-professional
    python3Full
    keepassxc
    dbeaver
    awscli
    which
    plasma-browser-integration
    curl
    wget
    tmux
    kitty
    openvpn3
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    jq
    yq
    sshuttle
    kaf
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
