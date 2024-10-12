#!#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project - Master of Science in Information Technology (MSIT)
# The purpose of this module is to take a list of target domains, run a whoisdns lookup operation and store the results
file="nsl_targets.txt;"
while IFS= read -r line; do
  whois "$line" | tee -a whois.txt ./whois_out/$line.txt
done < "$file"
