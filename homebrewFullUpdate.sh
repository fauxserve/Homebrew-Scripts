#!/bin/bash
clear

echo " Updating Homebrew core "
brew update
	if [ "$?" == "0" ]; then #error checking
		echo "	 Success updating Homebrew core"
	else
	    echo "	 ERROR - There was a problem with updating Homebrew core"
		exit "$?"
	fi

echo " Updating Cask apps "
brew cask update
	if [ "$?" == "0" ]; then #error checking
		echo "	 Success updating Cask apps"
	else
	    echo "	 ERROR - There was a problem with updating Cask apps"
		exit "$?"
	fi