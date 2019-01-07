import java.io.*;
import java.net.*;
import java.util.Scanner;

public class TCPsrClient implements Runnable {
	Thread sndT, rcvT;
	int i , nf, j;
	boolean[] count = new boolean[5];
	Socket s;
	PrintWriter pw;
	Scanner in, sc;
	public TCPsrClient() {
		in = new Scanner(System.in);
		System.out.println("ENTER THE NUMBER OF FRAMES :");
		nf = in.nextInt();
		sndT = new Thread(this);
		rcvT = new Thread(this);
		sndT.start();
		rcvT.start();
	}
    public static void main(String[] args) {
    	new TCPsrClient();
	}
	public void run() {
		try {
			s = new Socket("localhost", 7899);
			pw = new PrintWriter(s.getOutputStream(), true);
			sc = new Scanner(s.getInputStream());
			if(Thread.currentThread() == sndT) {
				i = 0;
				while(i <= nf) {
					if(i == nf) {
						j = 0;
						while(j < nf) {
							if(count[j] != true) {
								i = j;
								break;
							}
							j++;
						}
						if(i == nf) {
							pw.println("exit");
							System.exit(0);
						}
					}
					String frame = "FRAME "+i;
					System.out.println("SENDING "+frame+" TO SERVER");
					pw.println(frame);
					Thread.sleep(1500);
					i++;
				}
			}
			if(Thread.currentThread() == rcvT) {
				String rcv = sc.nextLine();
				if(rcv!=null) {
					System.out.println("RECEIVED ACKNOWLEDGEMENT FOR "+rcv);
					int p = Character.getNumericValue(rcv.charAt(6));
					count[p] = true;
					Thread.sleep(100);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
