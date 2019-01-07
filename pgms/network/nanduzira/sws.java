
import java.io.*;

import java.net.*;

import java.util.Scanner;

class sws

{

public static void main(String args[]) throws Exception

{

sws sw = new sws();
sw.run();

}

public void run() throws Exception

{
int j=0,flag=0;
String np= "not recieved";
Scanner sc=new Scanner(System.in);

System.out.println("Enter no of frames to be sent:");

int n=sc.nextInt();

Socket myskt=new Socket("localhost",9998);

PrintStream myps=new PrintStream(myskt.getOutputStream());
int i=0;
while(i<n)
{

System.out.println("Frame no "+i+" is sent");

myps.println(i);

BufferedReader bf=new BufferedReader(new InputStreamReader(myskt.getInputStream()));

String ack=bf.readLine();

if(flag==1)
{
System.out.println("Acknowledgement was Received for"+i+"from receiver");
break;
}
if(ack.compareTo(np)!=0)
{

System.out.println("Acknowledgement was Received for"+i+"from receiver");

i++;


Thread.sleep(4000);

}
else if(ack.compareTo(np)==0 && flag==0)
{
j=i;
System.out.println("negative acknowledgement for"+i);

i++;

}
if(i==n && flag==0){
i=j;
flag=1;
}
}
System.out.println("all frames send successfully");


}

}
