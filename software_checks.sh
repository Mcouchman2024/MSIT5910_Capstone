#!/bin/bash
# Couchman, M. (2024) MSIT Capstone Project, University of the People
# The user is responsible for the safe and lawful use of this software. It is soley intended for lawful purposes such as education
# Software checks Module

# Only run if first time running
if ! test -f ./installed; then
  # update apt cache
  sudo apt-get update
  echo "Apt-Cache updated... Checking for software"

# Check for nmap, install if absent
  if [ "$(which nmap)" = "" ]; then
    echo "namp is not installed. Installing now."
    sudo apt-get install --yes nmap && echo "Installed nmap on $(date) by user $(whoami)" >> log.txt
  else
    echo "nmap installed already."
  fi

# Check for nslookup, install if absent
  if [ "$(which nslookup)" = "" ]; then
    echo "nslookup is not installed... Installing now."
    sudo apt-get --yes install nslookup && echo "Installed nslookup on $(date) by user $(whoami)" >> log.txt
  else
    echo "nslookup installed already"
  fi

# update nmap scripts from database 
  sudo nmap --script-updatedb && echo "Updated nmap database on $(date) by user $(whoami)" >> log.txt
  echo "Nmap scripts are up to date"
  touch ./installed
fi

