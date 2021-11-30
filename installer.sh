#!/usr/bin/env bash

readonly INSTALL_DIR=/usr/local/bin;

function isRoot
{
    if [ "$EUID" -ne 0 ]; then
        return 1;
    fi
    return 0;
}

function printHelp
{
  echo "wpnew installer usage:"
  echo "sudo ./install -i"
}

function install
{
  cp --verbose ./wpnew $INSTALL_DIR || echo "There was a problem installing wpnew to $INSTALL_DIR.";
}

function uninstall
{
  rm -rf --verbose $INSTALL_DIR/wpnew || echo "Couldn't remove wpnew, try running 'sudo rm -rf /usr/local/bin/wpnew to remove manually.'";
}

function reinstall
{
  uninstall && install;
}

optstring='hiur';

while getopts ${optstring} arg; do
  case ${arg} in
    h)
      printHelp;
    ;;
    i)
      if isRoot; then
        if ! install; then
          echo "Installation failed with exit code $?";
        fi
      else
        echo "Must be ran as root";
        exit 1;
      fi
    ;;
    u)
      if isRoot; then
        if ! uninstall; then
          echo "Uninstallation failed with exit code $?";
        fi
      else
        echo "Must be ran as root!";
      fi
    ;;
    r)
      if isRoot; then
        if ! reinstall; then
          echo "Faied to reinstall with exit code $?";
        fi
      else
        echo "Must be ran as root!";
      fi
    ;;
    ?)
      echo "Invalid argument";
      printHelp;
    ;;
  esac
done