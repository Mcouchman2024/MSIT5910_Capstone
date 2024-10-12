#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project - Master of Science in Information Technology (MSIT)
# The user is responsible for the safe and lawful use of this software. It is soley intended for lawful purposes such as education
# This module runs nmap vulnerability scans over targets and saves output 

file="nsl_results.txt"

# Full vulnerability scan - Needs testing

while IFS= read -r line; do
  if echo $line | grep "failed"; then
    echo "Failed" >> nmres.txt && echo "Nmap failed to proceed due to bad input on $(date) by $(whoami)" >> uselog.txt
  else
    nmap -sV --script vuln "$line" | tee -a nmres.txt ./nmoutput/$line.txt
    cat ./nmoutput/$line.txt | grep -m 10 "CVE" | cut -f2 | xargs >> CVE.txt # Returns a maximum of 10 results
    cat ./nmoutput/$line.txt | grep "Service Info" | cut -d ' ' -f4-6 >> OS.txt
  fi
done < "$file"
file="nsl_results.txt"


# Basic scan - needs testing
while IFS= read -r line; do
  if echo $line | grep "failed"; then
    echo "Failed" >> nmbas.txt && echo "Nmap failed to proceed due to bad input on $(date) by $(whoami)" >> uselog.txt
  else
    nmap $line | grep -Eo '^[0-9]{1,5}' | xargs >> nmbas.txt 
  fi
done < "$file"




