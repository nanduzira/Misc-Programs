import java.io.*;
import java.net.*;
import java.util.*;

class UDPClient {
	public static void main(String[] args) throws Exception {
		Scanner in = new Scanner(System.in);
		DatagramSocket ds = new DatagramSocket();
		InetAddress IP = InetAddress.getByName("localhost");
		byte[] sendData = new byte[1024];
		byte[] receiveData = new byte[1024];
		System.out.println("ENTER A STRING :");
		String str = in.nextLine();
		sendData = str.getBytes();
		DatagramPacket sp = new DatagramPacket(sendData, sendData.length, IP, 6888);
		ds.send(sp);
		DatagramPacket rp = new DatagramPacket(receiveData, receiveData.length);
		ds.receive(rp);
		String newstr = new String(rp.getData());
		System.out.println("SERVER MODIFIED ENTRY :" + newstr);
		ds.close();
	}
}
