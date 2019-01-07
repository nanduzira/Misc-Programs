import java.io.*;

import java.net.*;

class swr

{

public static void main(String args[])throws Exception

{

swr sw = new swr();

sw.run();

}

public void run() throws Exception

{

String temp="any message",str="exit",two="2",np="not recieved";

ServerSocket myss=new ServerSocket(9998);

Socket ss_accept=myss.accept();

BufferedReader ss_bf=new BufferedReader(new InputStreamReader(ss_accept.getInputStream()));

PrintStream myps=new PrintStream(ss_accept.getOutputStream());
int flag=0;
while(temp.compareTo(str)!=0)

{

Thread.sleep(1000);

temp=ss_bf.readLine();


if(temp.compareTo(two)==0 && flag==1)
{
System.out.println("Frame "+two+" was received");
myps.println("Received");
break;
}
Thread.sleep(500);
if(temp.compareTo(two)!=0 ){
System.out.println("Frame "+temp+" was received");
myps.println("Received");
}
else if(temp.compareTo(two)==0 && flag==0){
myps.println(np);
flag=1;
//System.out.println("frame "+two+" is corrupted");
}

}
System.out.println("finished");


}
}
