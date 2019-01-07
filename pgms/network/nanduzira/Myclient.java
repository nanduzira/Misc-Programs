import java.io.*;
import java.net.*;
public class Myclient
{
public static void main(String args[])
{
try
{
Socket r=new Socket("localhost",5555);
DataOutputStream dout=new DataOutputStream(r.getOutputStream());


BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
System.out.println("enter the message:");
String str=br.readLine();
dout.writeUTF(str);
dout.flush();
DataInputStream din=new DataInputStream(r.getInputStream());
String st=din.readUTF();
System.out.println("uppercase is:"+st);
dout.close();

r.close();
}catch(Exception e)
{
System.out.println(e);
}
}
}
