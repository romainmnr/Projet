package rwb.java.proxy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.HashmapBO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.MachineBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

public class Proxy {
	String userId = null;
	String userRight = null;

	String srvId = null;
	String machineId = null;
	String portVRDE = null;
	BddServeurBO bdd = null;
	VirtualBoxBO vboxBo = null;

	List<ServeurBO> listServeur = null;
	ServeurBO srv = null;
	HashMap<String, Object> mapServer = null;

	List<MachineBO> listMachine = null;
	MachineBO machine = null;
	HashMap<String, Object> mapMachine = null;
	HashmapBO mapBO = new HashmapBO();

	/**
	 * 
	 * @param srv
	 * @param machine
	 * @param userId
	 * @param userRight
	 */
	public Proxy(String srv, String machine, String userId, String userRight) {
		this.srvId = srv;
		this.machineId = machine;
		this.userId = userId;
		this.userRight = userRight;
	}

	/**
	 * 
	 * @param srv
	 * @param machine
	 */
	public Proxy(String srv, String machine) {
		this(srv, machine, null, null);
	}

	/**
	 * 
	 * @param userId
	 */
	public Proxy(String userId) {
		this(null, null, userId, null);
	}

	/**
	 * 
	 */
	public Proxy() {
		this(null, null, null, null);
	}

	/**
	 * 
	 */
	public void connectionBDD() {
		bdd = new BddServeurBO();
		listServeur = bdd.getServeurs("enabled");
		srv = ServeurBO.getServeur(listServeur, this.srvId);
		bdd.close();
	}

	/**
	 * 
	 */
	public void connectionVB() {
		vboxBo = new VirtualBoxBO(new VirtualBoxDAO(srv), true);
	}

	/**
	 * 
	 */
	public void initAllInfos() {
		try {
			connectionVB();
			machine = vboxBo.getMachine(this.machineId);
			vboxBo.createInfosMachine(this.machineId);
			mapMachine = (HashMap<String, Object>) vboxBo.getInfosMachine(this.machineId);
			mapServer = (HashMap<String, Object>) vboxBo.getHostInfos();
			mapServer.put("HostOnly", vboxBo.getHostOnlyNetworks());
			mapServer.put("NAT", vboxBo.getNATNetworks());
			mapBO = new HashmapBO(mapMachine);
			listMachine = vboxBo.getListMachineBO();
			this.initVRDEPort();
		} catch (Exception e) {
			Log.warning(e.toString()); 
		}
	}

	/**
	 * 
	 * @return
	 */
	public Boolean checkRight() {
		Boolean r = false;
		if (!this.userId.isEmpty() && !this.userRight.isEmpty()) {
			if ("etudiant".equals(this.userRight)) {
				bdd = new BddServeurBO();
				if (this.userId.equals(bdd.getVmOwner(this.machineId))) {
					r = true;
				} else {
					r = false;
				}
				bdd.close();
			} else {
				r = true;
			}
		}
		return r;
	}

	/**
	 * 
	 * @return
	 */
	public List<MachineBO> getListMachine() {
		return listMachine;
	}

	/**
	 * 
	 * @param listMachine
	 */
	public void setListMachine(List<MachineBO> listMachine) {
		this.listMachine = listMachine;
	}

	/**
	 * 
	 */
	public void initSrvInfos() {
		connectionVB();
		mapServer = (HashMap<String, Object>) vboxBo.getHostInfos();
		listMachine = vboxBo.getListMachineBO();
	}
 
	/**
	 * 
	 * @return
	 */
	public BddServeurBO getBdd() {
		return bdd;
	}

	/**
	 * 
	 * @param bdd
	 */
	public void setBdd(BddServeurBO bdd) {
		this.bdd = bdd;
	}

	/**
	 * 
	 * @return
	 */
	public List<ServeurBO> getListServeur() {
		return listServeur;
	}

	/**
	 * 
	 * @param listServeur
	 */
	public void setListServeur(List<ServeurBO> listServeur) {
		this.listServeur = listServeur;
	}

	/**
	 * 
	 * @return
	 */
	public ServeurBO getSrv() {
		return srv;
	}

	/**
	 * 
	 * @param srv
	 */
	public void setSrv(ServeurBO srv) {
		this.srv = srv;
	}

	/**
	 * 
	 * @return
	 */
	public VirtualBoxBO getVboxBo() {
		return vboxBo;
	}

	/**
	 * 
	 * @param vboxBo
	 */
	public void setVboxBo(VirtualBoxBO vboxBo) {
		this.vboxBo = vboxBo;
	}

	/**
	 * 
	 * @return
	 */
	public MachineBO getMachine() {
		return machine;
	}

	/**
	 * 
	 * @param machine
	 */
	public void setMachine(MachineBO machine) {
		this.machine = machine;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getMapMachine() {
		return mapMachine;
	}

	/**
	 * 
	 * @param mapMachine
	 */
	public void setMapMachine(Map<String, Object> mapMachine) {
		this.mapMachine = (HashMap<String, Object>) mapMachine;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getMapServer() {
		return mapServer;
	}

	/**
	 * 
	 * @param mapServer
	 */
	public void setMapServer(Map<String, Object> mapServer) {
		this.mapServer = (HashMap<String, Object>) mapServer;
	}

	/**
	 * 
	 * @return
	 */
	public HashmapBO getMapBO() {
		return mapBO;
	}

	/**
	 * 
	 * @param mapBO
	 */
	public void setMapBO(HashmapBO mapBO) {
		this.mapBO = mapBO;
	}

	/**
	 * 
	 * @return
	 */
	public String getSrvId() {
		return srvId;
	}

	/**
	 * 
	 * @param srvId
	 */
	public void setSrvId(String srvId) {
		this.srvId = srvId;
	}

	/**
	 * 
	 * @return
	 */
	public String getMachineId() {
		return machineId;
	}

	/**
	 * 
	 * @param machineId
	 */
	public void setMachineId(String machineId) {
		this.machineId = machineId;
	}

	/**
	 * 
	 */
	public void initVRDEPort() {
		this.portVRDE = "3389";
	}

	/**
	 * 
	 * @return
	 */
	public String getVRDEMachinePort() {
		return this.portVRDE;
	}
}
