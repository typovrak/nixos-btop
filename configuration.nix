{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.btop = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/btop
		mkdir ${home}/.config/btop
		chown ${username}:${group} ${home}/.config/btop
		chmod 700 ${home}/.config/btop

		cp ${./btop.conf} ${home}/.config/btop/btop.conf
		chown ${username}:${group} ${home}/.config/btop/btop.conf
		chmod 600 ${home}/.config/btop/btop.conf

		mkdir ${home}/.config/btop/themes
		chown ${username}:${group} ${home}/.config/btop/themes
		chmod 700 ${home}/.config/btop/themes

		cp ${./catppuccin_mocha.theme} ${home}/.config/btop/themes/catppuccin_mocha.theme
		chown ${username}:${group} ${home}/.config/btop/themes/catppuccin_mocha.theme
		chmod 600 ${home}/.config/btop/themes/catppuccin_mocha.theme
	'';

	environment.systemPackages = with pksg; [
		btop
	];
}
