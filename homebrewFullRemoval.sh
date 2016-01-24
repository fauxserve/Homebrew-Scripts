#!/bin/bash
clear 
# partial inspiriation:
# http://digitizor.com/install-homebrew-osx-el-capitan/

## Functions To Remove Homebrew Packages/Apps ##
function initialCleanup () {
	echo "	 Initial Homebrew Cleanup "
	rm -rf /usr/local/Cellar /usr/local/.git
		if [ "$?" == "0" ]; then #error checking
			echo "	 Success deleting Homebrew paths"
		else
		    echo "	 ERROR - There was a problem with deleting Homebrew paths"
			exit "$?"
		fi
	brew cleanup
		if [ "$?" == "0" ]; then #error checking
			echo "	 Success cleaning up with brew"
		else
		    echo "	 ERROR - There was a problem with cleaning up with brew"
			exit "$?"
		fi
}
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

initialCleanup
removeCaskApps
removeBrewPackages
uninstallHomebrew

