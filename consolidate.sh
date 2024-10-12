#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project - Master of Science in Information Technology (MSIT)
# The user is responsible for the safe and lawful use of this software. It is soley intended for lawful purposes such as education
# This module runs consolidates the information gathered into a text file for subsequent upload to a database
paste -d ',' date.txt nsl_targets.txt nsl_results.txt nmbas.txt pingres.txt CVE.txt OS.txt > combined.txt


