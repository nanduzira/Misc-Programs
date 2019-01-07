import java.io.*;
import java.net.*;
import java.util.Scanner;

public class SMTPServer {
	public static void main(String args[]) {
		try {
			ServerSocket ss = new ServerSocket(6666);
			Socket s = ss.accept();
			Scanner in = new Scanner(s.getInputStream());
			String from = in.nextLine();
			System.out.println("FROM : "+from);
			String to = in.nextLine();
			System.out.println("TO : "+to);
			System.out.print("MSG : ");
			String[] msg = in.nextLine().split("-");
			for(int i = 0; i < msg.length; i++)
				System.out.println(msg[i]);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
