#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project - Master of Science in Information Technology (MSIT)
# The user is responsible for the safe and lawful use of this software. It is soley intended for lawful purposes such as education
# The purpose of this module is to take a list of target domains, determine the IP address of each, and extract them into a file
targets="nsl_targets.txt"
while IFS= read -r line; do
  if nslookup $line | grep "can't find"; then # ensures valid check to proceed
    echo "Nslookup_failed_on_$line." >> nsl_results.txt && echo "Failed nslookup attempt on $(date) by $(whoami)" >> uselog.txt
    sleep 2s 
  else
    echo "$(date +%F)" >> date.txt
    nslookup $line | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | tail -1 >> nsl_results.txt
    echo "Nslookup successful. Results output and proceeding to next stage"
  fi
done < "$targets"

