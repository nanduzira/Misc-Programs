import java.util.Scanner;
import java.net.*;
import java.io.*;

public class UDPbrServer implements Runnable{
	DatagramSocket ds;
	DatagramPacket sp, rp;
	Scanner in;
	String ipaddr[] = new String[15];
	String msg;
	int port[] = new int[15]; 
	int i, j;
	InetAddress IP[] = new InetAddress[15];
	byte[] snd, rcv;
	
	public UDPbrServer() {
		try {
			i = 0;
			in = new Scanner(System.in);
			snd = new byte[1024];
			rcv = new byte[1024];
			ds = new DatagramSocket(6880);
			new Thread(this).start();
			while(true) {
				rp = new DatagramPacket(rcv, rcv.length);
				ds.receive(rp);
				IP[i] = rp.getAddress();
				//ipaddr[i] = IP.toString();
				port[i] = rp.getPort();
				System.out.println("CONNECTED IP :"+IP[i].toString()+" PORT :"+port[i]);
				i++;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void run() {
		try {
			while(true) {
				//msg.delete(0,msg.length());
				msg = in.nextLine();
				snd = msg.getBytes();
				for(j = 0; j < i; j++) {
					sp = new DatagramPacket(snd, snd.length, IP[j], port[j]);
					ds.send(sp);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new UDPbrServer();
	}
}
