import java.util.Scanner;
import java.net.*;

public class UDPbiServer implements Runnable {
	DatagramSocket ds;
	DatagramPacket sp, rp;
	Scanner in;
	byte[] snd, rcv;
	
	public UDPbiServer() {
		try {
			in = new Scanner(System.in);
			snd = new byte[1024];
			rcv = new byte[1024];
			ds = new DatagramSocket(6888);
			
			new Thread(this).start();
			
			InetAddress IP = InetAddress.getLocalHost();
			while(true) {
				String msg = in.nextLine();
				snd = msg.getBytes();
				sp = new DatagramPacket(snd, snd.length, IP, 2888);
				ds.send(sp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void run() {
		try {
			while(true) {
				rp = new DatagramPacket(rcv, rcv.length);
				ds.receive(rp);
				String msg = new String(rp.getData(), 0, rp.getLength());
				System.out.println("CLIENT : " + msg);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new UDPbiServer();
	}
}
