#!/bin/bash 


   
   while read ip; 
do 
     
   echo "Pendrive UnBlocking on" $ip
   sshpass -p 'root123' ssh root@$ip sudo chmod 755 /media < /dev/null;

   sshpass -p 'root123' ssh root@$ip usermod -U S3A1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -U S3A2< /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -U S3B1< /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -U S3B2 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S7A1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L S7A2 < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -U student < /dev/null;
   sshpass -p 'root123' ssh root@$ip usermod -L uniexam < /dev/null;
   echo "Finished" $ip
done < ipaddress.txt
