import java.net.*;
import java.util.*;
import java.io.*;

class biClient implements Runnable {
	Thread sendT, receiveT;
	Scanner in, out;
	PrintWriter pw;
	String send, receive;
	
	public biClient() {
		try {
			sendT = new Thread(this);
			receiveT = new Thread(this);
			Socket s = new Socket("localhost", 8056);
			in = new Scanner(System.in);
			out = new Scanner(s.getInputStream());
			pw = new PrintWriter(s.getOutputStream(), true);
			sendT.start();
			receiveT.start();
		} catch(Exception ee) {
			System.out.println(ee);
		}
	}
	
	public void run() {
	    try {
		    if(Thread.currentThread() == receiveT) {
		        do {
		        	receive = out.nextLine();
		        	System.out.println("SERVER :" + receive);
		        } while(!receive.equals("exit"));
		    }
		    else {
		    	while(true) {
		    		send = in.nextLine();
		    		pw.println(send);
		    		Thread.sleep(10);
		    	}
		    }
		} catch(Exception ee) {
			System.out.println(ee);
		}
	}
	
	public static void main(String[] args) {
		new biClient();
	}
}
