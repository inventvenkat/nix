{ config, pkgs, ... }:

with pkgs;

let
  zsh-nix-shell = fetchFromGitHub {
    "owner" = "chisui";
    "repo" = "zsh-nix-shell";
    "rev" = "5dd73237d598563e03ea8e84ff9deb6a6ed70848";
    "sha256" = "0zkb1yf52r2bz39wjzybdaaa33lz6lhhlj7khcwrhlc6p47hwp6n";
  };

in

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.termite.enable = true;
  home.packages = [ 
	pkgs.zsh
	pkgs.i3lock-fancy
	pkgs.xmobar
	pkgs.vscode
	pkgs.nodePackages_10_x.bower
  ];
  xsession = {
    enable = true;
    initExtra = lib.readFile ~/.xsessionrc;
    windowManager.command = "xmonad";
  };
  services.taffybar.enable = true;
  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
	export ZSH=/nix/store/0lx4bxlq556193zyi26p99sclvxv6n4g-oh-my-zsh-2019-01-15/share/oh-my-zsh/
	source ~/.alias

	ZSH_THEME="ys"
	plugin=(git)
	source $ZSH/oh-my-zsh.sh
	source ${zsh-nix-shell.out}/nix-shell.plugin.zsh
  '';
}
