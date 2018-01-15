package rwb.servlet.general;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketTimeoutException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rwb.java.divers.Log;
import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.server.bo.ServeurBO;

/**
 * Servlet implementation class PingServer
 */
@WebServlet("/PingServer")
public class PingServer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PingServer() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BddServeurBO bdd = new BddServeurBO();
		List<ServeurBO> listServeur = bdd.getServeurs("all");
		bdd.close(); 




		HashMap<String,Object> data = new HashMap<>();


		for(ServeurBO s : listServeur){
			long total		 =  1L;
			String hostIp	 = 	s.getIp();
			int hostPort 	 = 	s.getPort();
			HashMap<String,Object> row = new HashMap<>();
			
			SocketAddress sockaddr = new InetSocketAddress(hostIp, hostPort);
			// Create your socket
			Socket socket = new Socket();
			boolean online = true;
			// Connect with 10 s timeout
			long start = System.currentTimeMillis();
			try {
				socket.connect(sockaddr, 1000);
				long end = System.currentTimeMillis();
				total = end-start;
				socket.close();
			} catch (SocketTimeoutException stex) {
				Log.warning(stex.toString());
				online=false;
			} catch (IOException iOException) {
				Log.warning(iOException.toString());
				online = false;    
			}
			
			row.put("id", s.getId());
			row.put("name", s.getName());
			row.put("ip", s.getIp());
			row.put("port", s.getPort());
			row.put("enabled", s.getState());
			row.put("state", online);
			if(online){
				row.put("time", Long.toString(total));
			}else{
				row.put("time", "");
			}
			
			data.put(s.getName(), row);

		}
		Gson gson = new Gson(); 
		String json = gson.toJson(data); 

		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);


	}

}
