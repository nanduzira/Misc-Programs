import java.io.*;
import java.net.*;
import java.util.Scanner;

public class SMTPClient {
	public static void main(String args[]) {
		try {
			Socket s = new Socket("10.1.2.13", 6665);
			Scanner in = new Scanner(System.in);
			PrintWriter pw = new PrintWriter(s.getOutputStream(), true);
			System.out.print("FROM : ");
			String from = in.nextLine();
			System.out.print("TO : ");
			String to = in.nextLine();
			System.out.print("MSG : ");
			String msg = "";
			while(true) {
				String temp = in.nextLine();
				if(temp.equals("end"))
					break;
				msg = msg.concat(temp+"-");
			}
			pw.println(from);
			pw.println(to);
			pw.println(msg);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
