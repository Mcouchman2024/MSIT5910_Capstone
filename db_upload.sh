#!/bin/bash
# Couchman, M. (2024) University of the People Capstone Project 
# This module connects to a preconstructed database and inserts captured
# OSINT data into tables for storage and retrieval 
# 
# Default credentials allow access to Xampp MySQL
user="root"
pass=""
# Database name is specified below, but can be altered by user
db_name="example"
# Access MySQL and Create Table if it isn't created yet. 
createdb="CREATE DATABASE IF NOT EXISTS $db_name; use $db_name; CREATE TABLE IF NOT EXISTS osint ( ID INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL, Date DATE, Domain_Name VARCHAR(255), IP VARCHAR(255), Open_Ports VARCHAR(255), Responds_ICMP VARCHAR(3), CVE VARCHAR(8000), OS VARCHAR(255) );"
/opt/lampp/bin/mysql --local-infile=1 -u $user -p $pass -e "$createdb;"
qry="use capdata; LOAD DATA LOCAL INFILE '/home/capstone/Cap/combined.txt' INTO TABLE osint FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (Date, Domain_Name, IP, Open_Ports, Responds_ICMP, CVE, OS);"
/opt/lampp/bin/mysql -u $user -p $pass $db_name -e "$qry" && echo "Database upload successful"
  
