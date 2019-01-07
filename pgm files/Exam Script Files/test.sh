#!/bin/bash 


   
   while read ip; 
do 
   
   sshpass -p 'root123' ssh root@$ip userdel uniexam < /dev/null;
   sshpass -p 'root123' ssh root@$ip rm -rf /home/uniexam < /dev/null;
   
   echo "Pendrive Blocking on" $ip
   sshpass -p 'root123' ssh root@$ip sudo chmod 700 /media < /dev/null;

   sshpass -p 'root123' scp users.txt root@$ip:/home 
   sshpass -p 'root123' ssh root@$ip newusers /home/users.txt < /dev/null;
   echo "Users Created at" $ip
   sshpass -p 'root123' ssh root@$ip usermod -L S3A1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S3A2 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S7A1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S7A2 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S3B1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S3B2 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L student < /dev/null;
   echo "Finished" $ip
done < ipaddress.txt
