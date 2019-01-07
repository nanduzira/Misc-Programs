import java.net.*;
import java.io.*;
import java.util.Scanner;

public class TCPFngrClnt {
	public static void main(String[] args) {
		String uname = "", hname = "";
		if(args.length != 1)
			System.out.println("INVALID NUMBER OF PARAMETERS.");
		else if(args[0].indexOf("@") == -1)
			System.out.println("INVALID PARAMETER.");
		else {
			uname = args[0].substring(0, args[0].indexOf("@"));
			hname = args[0].substring(args[0].indexOf("@")+1, args[0].length());
		}
		try {
			Socket s = new Socket(hname, 80);
			Scanner in = new Scanner(s.getInputStream());
			PrintWriter pw = new PrintWriter(s.getOutputStream(), true);
			pw.println(uname);
			boolean more = true;
			while(more) {
				String line = in.nextLine();
				if(line == null)
					more = false;
				else
					System.out.println(line);
			}
			pw.close();
			in.close();
			s.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
