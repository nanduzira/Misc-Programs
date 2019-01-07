//import java.io.*;
import java.net.*;
import java.util.*;

class UDPClientPal {
	public static void main(String[] args) throws Exception {
		Scanner in = new Scanner(System.in);
		DatagramSocket ds = new DatagramSocket();
		InetAddress IP = InetAddress.getByName("localhost");
		byte[] sendData = new byte[1024];
		byte[] receivedData = new byte[1024];
		System.out.println("ENTER A STRING :");
		String str = in.nextLine();
		sendData = str.getBytes();
		DatagramPacket sp = new DatagramPacket(sendData, sendData.length, IP, 6810);
		ds.send(sp);
		DatagramPacket rp = new DatagramPacket(receivedData, receivedData.length);
		ds.receive(rp);
		String newstr = new String(rp.getData());
		System.out.println("THE STRING " + str + " IS " + newstr);
		ds.close();
	}
}
