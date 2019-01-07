//import java.io.*;
import java.net.*;

class UDPServerPal {
	public static void main(String[] args) throws Exception {
		DatagramSocket ds = new DatagramSocket(6810);
		byte[] receivedData = new byte[1024];
		byte[] sendData = new byte[1024];
		while(true) {
			DatagramPacket rp = new DatagramPacket(receivedData, receivedData.length);
			ds.receive(rp);
			String str = new String(rp.getData());
			System.out.println("CHECK STRING :" + str);
			InetAddress IP = rp.getAddress();
			int port = rp.getPort();
			String revStr = new StringBuffer(str).reverse().toString();
			String palStr = "NOT A PALINDROME\n";
			if(str.compareTo(revStr)==0)
				palStr = String.replace("NOT","");
			System.out.println("CHECK STRING :" + str + " *" + revStr+ "*" + palStr);
			sendData = palStr.getBytes();
			DatagramPacket sp = new DatagramPacket(sendData, sendData.length, IP, port);
			ds.send(sp);
		}
	}
}
