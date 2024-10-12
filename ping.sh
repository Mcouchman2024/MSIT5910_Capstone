#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project - Master of Science in Information Technology (MSIT)
# The user is responsible for the safe and lawful use of this software. It is soley intended for lawful purposes such as education
# The purpose of this module is to test targets for a response to an ICMP ping
file="./nsl_results.txt"
while IFS= read -r line; do
  if ping -c 1 $line | grep "1 received"; then
    echo "Y" >> pingres.txt
  else
    echo "N" >> pingres.txt
  fi
done < "$file"
