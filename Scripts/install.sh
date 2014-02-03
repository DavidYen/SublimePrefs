#!/bin/bash
if [ ! -n "$1" ]; then
  echo Usage: install.sh SUBLIME_CONFIG_DIR
  exit 1
fi

SUBLIME_DIR=$1
if [ ! -d "$SUBLIME_DIR/Packages" ]; then
  echo Install script expects sublime directory as the first argument
  exit 1 
fi

USER_PREFS=$SUBLIME_DIR/Packages/User
USER_PREFS_BAK=$USER_PREFS.bak
SUBLIME_PREFS=$(pwd)/$(dirname "${BASH_SOURCE[0]}")/../UserPrefs
echo $SUBLIME_PREFS
echo Backing up User Preferences to "$USER_PREFS"
mv "$USER_PREFS" "$USER_PREFS_BAK"

echo Linking Sublime User Preferences...
ln -s "$SUBLIME_PREFS" "$USER_PREFS"

exit