
 while read ip; 
do 
   sshpass -p 'root123' scp users.txt root@$ip:/home 
   sshpass -p 'root123' ssh root@$ip newusers /home/users.txt < /dev/null;
   echo "Users Created at" $ip
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/S3A1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/S3A2< /dev/null;
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/S7A1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/S7A2 < /dev/null;
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/S3B1 < /dev/null;
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/S3B2 < /dev/null;
    sshpass -p'root123' ssh root@$ip usermod -L uniexam < /dev/null;
    sshpass -p'root123' ssh root@$ip chmod -R 750 /home/uniexam < /dev/null;
   sshpass -p 'root123' ssh root@$ip chmod -R 750 /home/student < /dev/null;
   echo "Finished" $ip
done < ipaddress.txt
