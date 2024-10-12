#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project - Master of Science in Information Technology (MSIT)
# The user is responsible for the safe and lawful use of this software. It is soley intended for lawful purposes such as education
# This is the main program. It brings together the different modules for use
sh ./software_checks.sh 
# Run checks to ensure directories and text files exist. Creates files if they don't exist
if ! test -f './log'; then
  touch log
fi
if ! test -f './nsl_targets.txt'; then
  touch nsl_targets.txt && echo "Created file nsl_targets.txt by $(whoami) on $(date)" >> log
fi
if ! test -f './nsl_results.txt'; then
  touch nsl_results.txt && echo "Created file nsl_results.txt by $(whoami) on $(date)" >> log
fi 
if ! test -f './nsl_temp.txt'; then
  touch nsl_temp.txt & echo "Created nsl_temp.txt by $(whoami) on $(date)" >> log
fi
if ! test -f './uselog.txt'; then
  touch uselog.txt && echo "Created uselog.txt by $(whoami) on $(date)" >> log
fi
if ! test -f './nmres.txt'; then
  touch nmres.txt && echo "Created nmres.txt by $(whoami) on $(date)" >> log
fi
if ! test -d nmoutput; then
  mkdir nmoutput && echo "Created directory nmoutput by $(whoami) on $(date)" >> log
fi
if ! test -d whois_out; then
  mkdir whois_out && echo "Created directory whois_out by $(whoami) on $(date)" >> log
fi
if ! test -f OS.txt; then
  touch OS.txt && echo "Created OS.txt by $(whoami) on $(date)" >> log
fi
if ! test -f CVE.txt; then
  touch CVE.txt && echo "Created CVE.txt by $(whoami) on $(date)" >> log
fi
if ! test -f combined.txt; then
  touch combined.txt && echo "Created combined.txt by $(whoami) on $(date)" >> log
fi
sh nsl.sh
sh ping.sh
sh nm.sh
sh consolidate.sh
sh db_upload.sh 

