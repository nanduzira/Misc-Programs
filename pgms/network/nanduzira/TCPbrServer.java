import java.io.*;
import java.net.*;
import java.util.*;

public class TCPbrServer implements Runnable{
	Scanner in;
	ServerSocket ss;
	Socket s[]= new Socket[10];
	int c, i;
	String str;
	DataOutputStream dout;
	public TCPbrServer() {
		try {
			c = 0;
			in = new Scanner(System.in);
			ss=new ServerSocket(1024);
			new Thread(this).start();
			while(true) {
				s[c++] = ss.accept();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void run() {
		try {
			while(true) {
				str = in.nextLine();
				for(i = 0; i < c; i++) {
					dout=new DataOutputStream(s[i].getOutputStream());
					dout.writeUTF(str);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
		new TCPbrServer();
	}
}
