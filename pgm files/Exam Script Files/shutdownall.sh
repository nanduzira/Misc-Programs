 while read ip; 
do 
sshpass -p 'root123' ssh root@$ip shutdown -h now < /dev/null;
done < ipaddress.txt
