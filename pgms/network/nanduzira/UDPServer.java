import java.io.*;
import java.net.*;

class UDPServer {
	public static void main(String[] args) throws Exception {
		DatagramSocket ds = new DatagramSocket(6888);
		byte[] receivedData = new byte[1024];
		byte[] sendData = new byte[1024];
		while(true) {
			DatagramPacket rp = new DatagramPacket(receivedData, receivedData.length);
			ds.receive(rp);
			String str = new String(rp.getData());
			System.out.println("CLIENT ENTRY :" + str);
			InetAddress IP = rp.getAddress();
			int port = rp.getPort();
			String capStr = str.toUpperCase();
			sendData = capStr.getBytes();
			DatagramPacket sp = new DatagramPacket(sendData, sendData.length, IP, port);
			ds.send(sp);
		}
	}
}
