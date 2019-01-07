import java.io.*;
import java.net.*;
import java.util.*;
public class Myserver
{
public static void main(String args[])
{
try
{
int count=0;
Scanner sc = new Scanner(System.in);
ServerSocket ss=new ServerSocket(5555);
Socket r[]= new Socket[10];
String str =sc.nextLine();
while(count<4)
{
r[count]=ss.accept();
DataOutputStream dout=new DataOutputStream(r[count].getOutputStream());
count++;
dout.writeUTF(str);
}

}
catch(Exception e)
{
System.out.println(e);
}
}
}
