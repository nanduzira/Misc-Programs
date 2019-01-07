import java.net.*;
import java.util.Scanner;
import java.io.*;

public class TCPsnwServer implements Runnable {
	public static void main(String[] args) {
		new TCPsnwServer().run();
	}
	public void run() {
		String exit = "exit", rcv ="blah";
		try {
			ServerSocket ss = new ServerSocket(7899);
			Socket s = ss.accept();
			Scanner in = new Scanner(s.getInputStream());
			PrintWriter pw = new PrintWriter(s.getOutputStream(), true);
			while(rcv.compareTo(exit)!=0) {
				Thread.sleep(500);
				rcv = in.nextLine();
				if(rcv.compareTo(exit)==0) break;
				System.out.println("RECEIVED "+rcv+" FROM THE CLIENT");
				Thread.sleep(500);
				pw.println(rcv);
			}
			System.out.println("ALL FRAMES RECEIVED");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
