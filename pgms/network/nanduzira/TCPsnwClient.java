import java.io.*;
import java.net.*;
import java.util.Scanner;

public class TCPsnwClient {
        public static void main(String[] args) {
        	new TCPsnwClient().run();
	}
	public void run() {
		Scanner in = new Scanner(System.in);
		System.out.println("ENTER THE NUMBER OF FRAMES :");
		int i = 0, nf = in.nextInt();
		try {
			Socket s = new Socket("localhost", 7899);
			PrintWriter pw = new PrintWriter(s.getOutputStream(), true);
			Scanner sc = new Scanner(s.getInputStream());
			while(i <= nf) {
				if(i == nf) {
					pw.println("exit");
					break;
				}
				String frame = "FRAME "+i;
				System.out.println("SENDING "+frame+" TO SERVER");
				pw.println(frame);
				String rcv = sc.nextLine();
				if(rcv!=null) {
					System.out.println("RECEIVED ACKNOWLEDGEMENT FOR "+rcv);
					i++;
					Thread.sleep(500);
				}
				else
					pw.println(frame);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
