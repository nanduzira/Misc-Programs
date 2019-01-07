#!/bin/bash 
   while read mac; 
do 
     wakeonlan $mac

 
done < mac.txt
