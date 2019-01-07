#!/bin/bash 
    
   while read ip; 
do 
  sshpass -p 'itims181' scp users.txt root@$ip:/home/users.txt < /dev/null;
  sshpass -p 'itims181' ssh root@$ip newusers /home/users.txt < /dev/null;

echo "Finished" $ip

done < ipaddress1.txt
