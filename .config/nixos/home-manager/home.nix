{ config, pkgs, ... }:

{
  home.username = "calimuun";
  home.homeDirectory = "/home/calimuun";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fastfetch
    hyprshot
    syncthing
    localsend
    vesktop
    obs-studio
    nwg-look
    vscodium
    nodejs
    ripdrag
    stow
    openjdk25
    keepassxc
    libappindicator
    libappindicator-gtk3
    openjfx
    qbittorrent
    unrar-free
    joplin-desktop
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    
    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };

      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/Pessoal/Prog/SSH/GitHub/ssh_github_auth";
        IdentitiesOnly = true;
      };
    };

  };

  services.ssh-agent.enable = true;
  services.syncthing.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "calimuun";
      user.signingkey = "~/Pessoal/Prog/SSH/GitHub/ssh_github_sign";
      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "https://github.com/";
      commit.gpgsign = true;
      gpg.format = "ssh";
    };
  };

  home.file.".bashrc" = {
    text = ''
      PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\n\u@\h in  NixOS at ''${PS1_CMD1} \w \n󰘍 \\$ '
      alias rebuild='sudo nixos-rebuild switch --flake "$HOME/Pessoal/dotfiles/.config/nixos#novac"'
      export PATH="$HOME/Pessoal/Scripts:$PATH"

      fastfetch
    '';
  };

}
