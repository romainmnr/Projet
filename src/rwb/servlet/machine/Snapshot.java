package rwb.servlet.machine;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class Snapshot
 */
@WebServlet("/Snapshot")
public class Snapshot extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Snapshot() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String serverId = (String)request.getParameter("vm-page-srv");
		String machineId = (String)request.getParameter("vm-page-vm");
		
		
		Boolean error = false;
		VirtualBoxBO vbox = null;
		BddServeurBO bdd = null; 
		List<ServeurBO> listServeur = null;
		HashMap<String,Object> data = new HashMap<>();
		 
		
		try {
			Log.info("Try to get snapshots  ...");
			
			bdd = new BddServeurBO();
			listServeur = bdd.getServeurs("enabled");
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);
			
			vbox = new VirtualBoxBO(new VirtualBoxDAO(srv),true);
			vbox.createInfosMachine(machineId);
			 
			
			if(request.getParameter("fn") != null){
				String function = (String)request.getParameter("fn");
				String param = null;
				if(request.getParameter("param") != null){
					param = (String)request.getParameter("param");
				}
				 
				switch(function){
				case "getSnapshots":  
					data.put("snapshot", vbox.getTreeSnapshotsName(machineId)); 
					break;
				case "takeSnapshot":
					vbox.takeSnap(machineId, machineId+"_"+new SimpleDateFormat("dd-MM-yy_HH:mm:ss").format(new Date()));
					data.put("snapshot", vbox.getTreeSnapshotsName(machineId)); 
					break;
				case "deleteSnap":
					param = vbox.getMachine(machineId).getSnapshotBO().findSnapByName(param).getId();
					vbox.deleteSnapById(machineId, param);
					data.put("snapshot", vbox.getTreeSnapshotsName(machineId)); 
					break;
				case "restoreSnap":
					vbox.restoreFromSnapName(machineId, param);
					data.put("snapshot", vbox.getTreeSnapshotsName(machineId)); 
					break;
					
				
				default:
					break;
					
				}
				
 			}
			 
			 
		} catch (Exception e) {
			error = true;
			Log.warning(e.toString());
			 
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
			header.put("msg", " ok");
		}
		
		header.put("srvId", serverId);
		header.put("vmId", machineId);
		 
			 
		resp.put("header", header);
		resp.put("data", data);
			
		
		Gson gson = new Gson(); 
		String json = gson.toJson(resp); 
			
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);
	
	
	
	
	
	}

}
