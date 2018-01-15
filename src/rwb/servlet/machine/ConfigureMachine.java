package rwb.servlet.machine;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.HashmapBO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class ConfigureMachine
 */
@WebServlet("/ConfigureMachine")
public class ConfigureMachine extends HttpServlet {

	/**
	 * Attributes of class ConfigureMachine
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constants of class Configuremachine
	 */
	private static final String FALSE = "false";
	private static final String ENABLED = "enabled";
	private static final String NETWORKADAPTER = "cfg-network-adapter";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfigureMachine() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * Get information from the form
		 */
		HashmapBO map = new HashmapBO();

		String serverId = (String) request.getParameter("cfg-machine-srvid");
		String machineName = (String) request.getParameter("cfg-machine-vmid");

		map.setName((String) request.getParameter("cfg-general-basic-name"));
		map.setOs((String) request.getParameter("cfg-general-basic-os"));

		map.setSnapshotFolder((String) request.getParameter("cfg-general-advanced-snapshotFld"));
		map.setShareClipboard((String) request.getParameter("cfg-general-advanced-clipboard"));
		map.setShareDragDrop((String) request.getParameter("cfg-general-advanced-dragndrop"));

		map.setRam((String) request.getParameter("cfg-system-motherboard-ram"));
		map.setChipsetType((String) request.getParameter("cfg-system-motherboard-chipset"));
		map.setPointerSystem((String) request.getParameter("cfg-system-motherboard-pointerSystem"));
		if (request.getParameter("cfg-system-motherboard-activateioapic") != null) {
			map.setActivateIoAPIC("true");
		} else {
			map.setActivateIoAPIC(FALSE);
		}
		if (request.getParameter("cfg-system-motherboard-internalclockutc") != null) {
			map.setInternalClockUTC("true");
		} else {
			map.setInternalClockUTC(FALSE);
		}

		map.setNbCPU((String) request.getParameter("cfg-system-processor-nbcpu"));
		map.setAllocatedRessouces((String) request.getParameter("cfg-system-processor-allocatedressources"));

		map.setvRAM((String) request.getParameter("cfg-display-generalDisplay-vram"));
		map.setMonitorCount((String) request.getParameter("cfg-display-generalDisplay-monitorCount"));
		if (request.getParameter("cfg-display-generalDisplay-3DAcceleration") != null) {
			map.setAcceleration3d("true");
		} else {
			map.setAcceleration3d(FALSE);
		}
		if (request.getParameter("cfg-display-generalDisplay-2DAcceleration") != null) {
			map.setAcceleration2d("true");
		} else {
			map.setAcceleration2d(FALSE);
		}

		HashMap<String, Object> network = new HashMap<>();
		for (Long i = (long) 0; i < 4; i++) {
			HashMap<String, Object> adapter = new HashMap<>();
			adapter.put("number", i);
			if (request.getParameter(NETWORKADAPTER + i + "-enable") != null) {
				adapter.put(ENABLED, "true");
			} else {
				adapter.put(ENABLED, FALSE);
			}
			if (request.getParameter(NETWORKADAPTER + i + "-cableConnected") != null) {
				adapter.put("cableConnected", "true");
			} else {
				adapter.put("cableConnected", FALSE);
			}

			if (request.getParameter(NETWORKADAPTER + i + "-adapterType") != null) {
				adapter.put("adapterType", request.getParameter(NETWORKADAPTER + i + "-adapterType"));
			}
			if (request.getParameter(NETWORKADAPTER + i + "-promiscousMode") != null) {
				adapter.put("promiscuousMode", request.getParameter(NETWORKADAPTER + i + "-promiscousMode"));
			}
			if (request.getParameter(NETWORKADAPTER + i + "-selectModeNetwork") != null) {
				adapter.put("attachedTo", request.getParameter(NETWORKADAPTER + i + "-selectModeNetwork"));
			}
			if (request.getParameter(NETWORKADAPTER + i + "-nameNetwork") != null) {
				adapter.put("name", request.getParameter(NETWORKADAPTER + i + "-nameNetwork"));
			}

			network.put(Long.toString(i), adapter);
		}
		map.setNetwork(network);

		/*
		 * configure machine
		 */
		boolean error;
		try {

			Log.info("Try to modif Vm ...");

			BddServeurBO bdd = new BddServeurBO();
			List<ServeurBO> listServeur = bdd.getServeurs(ENABLED);
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);

			VirtualBoxBO vbox = new VirtualBoxBO(new VirtualBoxDAO(srv), true);
			Log.info("Co ok ");

			Log.info("####################### \n" + map.generateConfigHashMap().toString());

			error = vbox.modifMachine((HashMap<String, Object>) map.generateConfigHashMap(), machineName);

		} catch (Exception e) {
			error = true;
			Log.warning(e.toString());
			 
		}

		/**
		 * Response parse
		 */
		
		HashMap<String, Object> resp = new HashMap<>();
		HashMap<String, Object> header = new HashMap<>();

		if (error) {
			header.put("statut", "503");
			header.put("msg", "Machine not configure");
		} else {
			header.put("statut", "200");
			header.put("msg", "Machine configure");
		}

		
		header.put("vmId", machineName);
		header.put("srvId", serverId);
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("vmId", map.getName());
		data.put("srvId", serverId);
		
		resp.put("header", header);
		resp.put("data", data);

		Gson gson = new Gson();
		String json = gson.toJson(resp);

		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);

	}

}
