package rwb.servlet.vbox;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class ConfigureNetworkServer
 */
@WebServlet("/ConfigureNetworkServer")
public class ConfigureNetworkServer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfigureNetworkServer() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean error = false;
		VirtualBoxBO vbox = null;
		BddServeurBO bdd = null;
		List<ServeurBO> listServeur = null;
		HashMap<String,Object> data = new HashMap<>();
		String fn = "";
		String serverId = "";
		if(request.getParameter("fn")!=null){
			fn = (String) request.getParameter("fn");
			serverId = (String)request.getParameter("vm-page-srv");
		}
		try {
			bdd = new BddServeurBO();
			listServeur = bdd.getServeurs("enabled");
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);

			vbox = new VirtualBoxBO(new VirtualBoxDAO(srv),true);
			
			Map<String,Object> hostOnlyMap = new HashMap<>();
			Map<String,Object> hostOnlyMapAdapt = new HashMap<>();
			
			switch (fn){
			case "deleteHostOnlyNetwork":
				String nameNetwork = (String) request.getParameter("param");
				vbox.deleteHostOnlyNetwork(nameNetwork);
				break;
			case "createHostOnlyNetwork":
				vbox.createHostOnlyNetwork();;
				break;
			case "modifHostOnlyNetwork": 
				hostOnlyMapAdapt.put("Name",(String) request.getParameter("cfgsrv-hostOnly-name")); 
				hostOnlyMapAdapt.put("IPv4Address", (String) request.getParameter("cfgsrv-hostOnly-ipv4"));
				hostOnlyMapAdapt.put("IPv6Address", (String) request.getParameter("cfgsrv-hostOnly-ipv6"));
				hostOnlyMapAdapt.put("IPv4NetworkMask", (String) request.getParameter("cfgsrv-hostOnly-ipv4Mask"));
				hostOnlyMapAdapt.put("IPv6NetworkMask", (String) request.getParameter("cfgsrv-hostOnly-ipv6MaskLength"));

				if((String) request.getParameter("cfgsrv-hostOnly-dhcp-enable") != null){
					hostOnlyMapAdapt.put("DHCPEnabled", (String) request.getParameter("cfgsrv-hostOnly-dhcp-enable"));

					hostOnlyMapAdapt.put("DHCPServerIpAddress", (String) request.getParameter("cfgsrv-hostOnly-dhcp-address"));
					hostOnlyMapAdapt.put("DHCPLowerIp", (String) request.getParameter("cfgsrv-hostOnly-dhcp-lowerAdd"));
					hostOnlyMapAdapt.put("DHCPUpperIp", (String) request.getParameter("cfgsrv-hostOnly-dhcp-upperAdd"));
					hostOnlyMapAdapt.put("DHCPNetworkMask", (String) request.getParameter("cfgsrv-hostOnly-dhcp-mask"));

				}else{
					hostOnlyMapAdapt.put("DHCPEnabled", false);
				}
				hostOnlyMap.put("host", hostOnlyMapAdapt);

				vbox.modifHostOnlyNetwork((HashMap<String,Object>)hostOnlyMap);
				break;
			case "deleteNATNetwork":
				String nameNetwork2 = (String) request.getParameter("param");
				vbox.deleteNATNetwork(nameNetwork2);
				break;
			case "createNATNetwork":
				vbox.createNATNetwork((String) request.getParameter("cfgsrv-NATNetworkcreate-name"));
				break;
			case "modifNATNetwork":
				HashMap<String,Object> settings = new HashMap<String,Object>();
				settings.put("Name", (String) request.getParameter("cfgsrv-nat-name"));
				settings.put("CIDR", (String) request.getParameter("cfgsrv-NATNetwork-CIDR"));
				if((String) request.getParameter("cfgsrv-NATNetwork-DHCP") != null){
					settings.put("DHCP", "true");
				}else{
					settings.put("DHCP", "false");
				}
				if((String) request.getParameter("cfgsrv-NATNetwork-supportIPv6") != null){
					settings.put("IPv6", "true");
				}else{
					settings.put("IPv6", "false");
				}
				if((String) request.getParameter("cfgsrv-NATNetwork-IPv6Route") != null){
					settings.put("DefaultIPv6Route", "true");
				}else{
					settings.put("DefaultIPv6Route", "false");
				}
				vbox.modifNATNetwork((String) request.getParameter("param"), settings);

				break;
			default:
				break;

			}



			if (vbox.getHostOnlyNetworks() != null){
				data.put("HostOnlyNetworkServer", vbox.getHostOnlyNetworks());
			}else{

			}
			if(vbox.getNATNetworks() != null){
				data.put("NATNetworkServer", vbox.getNATNetworks());
			}else{

			}

		}catch (Exception e){
			error = true;
			 
		}




		/**
		 * Response parse 
		 */
		HashMap<String,Object> resp = new HashMap<>();
		HashMap<String,Object> header = new HashMap<>();
		if(error ){
			header.put("statut", "503");
			header.put("msg", "Not ok ");
		}else{
			header.put("statut", "200");
			header.put("msg", "Function ok");
		}




		resp.put("header", header);
		resp.put("data", data);


		Gson gson = new Gson(); 
		String json = gson.toJson(resp); 


		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);
	}

}
