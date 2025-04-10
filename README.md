# nixos-btop

nixos-btop = fetchGit {
	url = "https://github.com/typovrak/nixos-btop.git";
	ref = "main";
};

(import "${nixos-htop}/configuration.nix")
