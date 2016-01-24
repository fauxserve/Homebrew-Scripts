#!/bin/bash
clear
# set -x


brewPkgs="coreutils caskroom/cask/brew-cask mtr screenfetch dockutil"
caskApps="firefox google-chrome flash platypus sequel-pro textmate textwrangler"


## Functions To Install Homebrew Packages/Apps ##
function installBrewPackages () {
	echo " Installing Homebrew Packages "
	for aPkg in $brewPkgs; do
	echo " STEP - installing package $aPkg - " 
	brew install --force "$aPkg"
		if [ "$?" == "0" ]; then #error checking
	     	echo " Success installing package $aPkg"
		else
	     	echo " ERROR - There was a problem with installing package $aPkg"
	     	exit "$?"
		fi
	done
	}
function setCaskDock () {
	echo " Adding Cask App folder to Dock "
	dockutil --add '~/Applications' --view list --display folder --position 1
		if [ "$?" == "0" ]; then #error checking
	     	echo " Success added Cask App folder to Dock"
		else
	     	echo " ERROR - There was a problem with adding Cask App folder to Dock"
	     	exit "$?"
	 	fi
	}
function installCaskApps () {
	echo " Installing Homebrew Cask Apps "
	for anApp in $caskApps; do
	echo " STEP - installing app $anApp - "
	brew cask install --force "$anApp"
		if [ "$?" == "0" ]; then #error checking
	     	echo " Success installing app $anApp"
		else
	     	echo " ERROR - There was a problem with installing app $anApp"
	     	exit "$?"
	 	fi
	done
	}



## Call the functions ##
	installBrewPackages
	setCaskDock
	installCaskApps

