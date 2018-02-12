echo "Configuration started"
ip=$(arp -n | tail -n+2 | awk '{print $1","$3}' | grep -i ",34:ce" | awk -F, '{print $1}' | head -n 1)
bulbs=$(echo $ip | awk '{print NF}')
echo "$bulbs device(s) detected with MAC address match"
echo "Checking if port 55443 is open"
x=1

candidate_ip=$(echo $ip | awk '{print $1}')
verified_ip=$(netcat -zvw1 $candidate_ip 55443 2>&1 | grep "succeeded" | awk '{print $3}')

echo $verified_ip > ip.list
echo   > ip.list
echo "chambre" > ip.list
echo "$verified_ip added to ip.list"
echo "Configuration completed"
