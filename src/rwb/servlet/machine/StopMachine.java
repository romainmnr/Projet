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
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class StopMachine
 */
@WebServlet("/StopMachine")
public class StopMachine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StopMachine() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String serverId = (String) request.getParameter("stop-srv");
		String machineId = (String) request.getParameter("stop-vm");
		String mode = (String) request.getParameter("stopMode-vm");
		Boolean error = false;
		String state = "";
		VirtualBoxBO vbox = null;
		BddServeurBO bdd = null;
		List<ServeurBO> listServeur = null;

		try {
			Log.info("Try to stop VM ...");

			bdd = new BddServeurBO();
			listServeur = bdd.getServeurs("enabled");
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);

			vbox = new VirtualBoxBO(new VirtualBoxDAO(srv),true);

			switch (mode) {
			case "std":
				vbox.powerDownMachine(machineId);
				break;
			case "forced":
				vbox.powerDownForcedMachine(machineId);
				break;
			default:
				break;

			}
			state = vbox.getMachineState(machineId);
		} catch (Exception e) {
			error = true;
			Log.warning(e.toString());
			 

		}

		/**
		 * Response parse
		 */
		HashMap<String, Object> resp = new HashMap<>();
		HashMap<String, Object> header = new HashMap<>();
		if (error && !"PoweredOff".equals(state)) {
			header.put("statut", "503");
			header.put("msg", "Machine not off");
		} else {
			header.put("statut", "200");
			header.put("msg", "Machine off");
		}
		header.put("srvId", serverId);
		header.put("vmId", machineId);

		HashMap<String, Object> data = new HashMap<>();

		resp.put("header", header);
		resp.put("data", data);

		Gson gson = new Gson();
		String json = gson.toJson(resp);

		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);

	}

}
