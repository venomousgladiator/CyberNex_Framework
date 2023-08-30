#!/bin/bash
toilet -f smblock --filter border:metal 'Cybernex Multi-Tool'

echo "Enter Your IP: "
read IP

echo "Enter your port: "
read port

echo "Enter your Domain Name: "
read domain

echo " 1.Aggressive  2.Stleath Scan  3.Domain Scan  4. UDP Scan  5. IP Xmas  6. Domain Xmas "
read method

if [[ $method -eq 1 ]];
then
sudo nmap -A -sT -v $IP -p$port
elif [[ $method -eq 2 ]];
then
sudo nmap -sS -v $IP -p$port
elif [[ $method -eq 3 ]];
then
sudo nmap -v -A -sT $domain
elif [[ $method -eq 4 ]];
then
sudo nmap -sU -v $IP
elif [[ $method -eq 5 ]];
then
sudo nmap -sX $IP
elif [[ $method -eq 6 ]];
then
sudo nmap -sX $domain
fi