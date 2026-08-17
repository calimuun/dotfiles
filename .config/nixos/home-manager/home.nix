{ config, pkgs, ... }:

{
  home.username = "calimuun";
  home.homeDirectory = "/home/calimuun";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    hyprshot
    syncthing
    localsend
    vesktop
    virtualbox
    syncthing
    obs-studio
    steam
    nwg-look
    vscodium
    nodejs
    ripdrag
    stow
    openjdk25
    keepassxc
  ];

  programs.ssh = {
    enable = true;
    
    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/Pessoal/Prog/SSH/GitHub/ssh_github";
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
      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  home.file.".bashrc" = {
    text = ''
      PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\u@\h in  NixOS at ''${PS1_CMD1} \w \n󰘍 \\$ '
      alias rebuild='sudo nixos-rebuild switch --flake /home/calimuun/.config/nixos#novac'
      alias rebuild_home='home-manager switch --flake /home/calimuun/.config/nixos/home-manager#calimuun'
      export PATH="$HOME/Pessoal/Scripts:$PATH"
      
      export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent"
      if ! ssh-add -l | grep -q "$HOME/Pessoal/Prog/SSH/GitHub/ssh_github"; then
        ssh-add "$HOME/Pessoal/Prog/SSH/GitHub/ssh_github"
      fi

      clear
      fastfetch
    '';
  };

}
