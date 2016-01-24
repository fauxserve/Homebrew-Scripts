#!/bin/bash
clear 

## Functions To Remove Homebrew Packages/Apps ##
function removeCaskApps () {
	echo "	 Installing Homebrew Cask Apps "
	for anApp in `brew cask list`; do
	echo "	 STEP - removing app $anApp - "
	brew cask remove --force "$anApp"
		if [ "$?" == "0" ]; then #error checking
	     	echo "	 Success removing app $anApp"
		else
	     	echo "	 ERROR - There was a problem with removing app $anApp"
	     	exit "$?"
	 	fi
	done
	}
function removeBrewPackages () {
	echo "	 Installing Homebrew Packages "
	for aPkg in `brew list`; do
	echo "	 STEP - removing package $aPkg - " 
	brew remove --force "$aPkg"
		if [ "$?" == "0" ]; then #error checking
	     	echo "	 Success removing package $aPkg"
		else
	     	echo "	 ERROR - There was a problem with removing package $aPkg"
	     	exit "$?"
		fi
	done
	}
function uninstallHomebrew () {
	echo "	 Removing Homebrew Core "
	echo yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
	if [ "$?" == "0" ]; then #error checking
     	echo "	 Success removing Homebrew Core "
	else
     	echo "	 ERROR - There was a problem with removing Homebrew Core "
     	exit "$?"
 	fi
	 }

removeCaskApps
removeBrewPackages
uninstallHomebrew

