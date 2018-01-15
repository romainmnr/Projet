package rwb.java.divers;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.virtualbox_5_0.IMedium;


public class HashmapBO {

	private static final String STORAGE = "storage";
	private static final String NETWORK = "network";
	private static final String CONNECTORS = "connectors";
	private static final String NAMECONTROLLER = "nameController";
	private static final String TYPEBUS = "typeBus";
	private static final String FATIMES = "fa-times";

	private String name = " ";
	private String os = "";
	private String snapshotFolder = "";
	private String shareClipboard = "";
	private String shareDragDrop = "";
	private String ram = "";
	private String chipsetType = "";
	private String pointerSystem = "";
	private String activateIoAPIC = "";
	private String internalClockUTC = "";
	private String nbCPU = "";
	private String allocatedRessouces = "";
	private String vRAM = "";
	private String monitorCount = "";
	private String acceleration3d = "";
	private String acceleration2d = "";

	private String enabled = "enabled";
	private static final String FA_CHECK_GREEN = "fa-check green";
	private static final String FA_TIMES_RED = "fa-times red";
	
	private Map<String, Object> sharedFolder = new HashMap<>();
	private Map<String, Object> bootOrder = new HashMap<>();
	private Map<String, Object> storageController = new HashMap<>();
	private Map<String, Object> mapNetwork = new HashMap<>();
	private Map<String, Object> remoteServer = new HashMap<>();

	/**
	 * 
	 */
	public HashmapBO() {
		// create an instance of HashmapBO null
	}

	/**
	 * 
	 * @param map
	 */
	@SuppressWarnings("unchecked")
	public HashmapBO(Map<String, Object> map) {
		String general = "general";
		String basic = "basic";
		String advanced = "advanced";
		String system = "system";
		String motherboard = "motherBoard";
		String processor = "processor";
		String display = "display";
		String generalDisplay = "generalDisplay";
		String storage = STORAGE;
		String network = NETWORK;

		this.name = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(general)).get(basic)).get("name")
				.toString();
		this.os = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(general)).get(basic)).get("OS")
				.toString();

		this.snapshotFolder = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(general)).get(advanced))
				.get("snapshotFolder").toString();
		this.shareClipboard = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(general)).get(advanced))
				.get("shareClipboard").toString();
		this.shareDragDrop = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(general)).get(advanced))
				.get("shareDragDrop").toString();

		this.ram = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(motherboard)).get("RAM")
				.toString();
		this.bootOrder = (HashMap<String, Object>) ((HashMap<String, Object>) ((HashMap<String, Object>) map
				.get(system)).get(motherboard)).get("BootOrder");
		this.chipsetType = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(motherboard))
				.get("chipset").toString();
		this.pointerSystem = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(motherboard))
				.get("pointerSystem").toString();
		this.activateIoAPIC = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(motherboard))
				.get("activateIOAPIC").toString();
		this.internalClockUTC = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(motherboard))
				.get("internalClockUTC").toString();

		this.nbCPU = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(processor)).get("nbCPU")
				.toString();
		this.allocatedRessouces = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(system)).get(processor))
				.get("allocatedRessources").toString();

		this.vRAM = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(display)).get(generalDisplay))
				.get("VRAM").toString();
		this.monitorCount = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(display)).get(generalDisplay))
				.get("monitorCount").toString();
		this.acceleration3d = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(display))
				.get(generalDisplay)).get("3DAcceleration").toString();
		this.acceleration2d = ((HashMap<String, Object>) ((HashMap<String, Object>) map.get(display))
				.get(generalDisplay)).get("2DAcceleration").toString();

		this.storageController = (HashMap<String, Object>) map.get(storage);
		this.mapNetwork = (HashMap<String, Object>) map.get(network);
		this.remoteServer = (HashMap<String, Object>) ((HashMap<String, Object>) map.get(display)).get("remoteServer");
		this.sharedFolder = (HashMap<String, Object>) map.get("sharedFolders");
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> generateConfigHashMap() {
		Map<String, Object> infos = new HashMap<>();
		try {
			if (!this.name.isEmpty()) {
				infos.put("general basic Name", this.name);
			}
			if (!this.os.isEmpty()) {
				infos.put("general basic OS", this.os);
			}
			if (!this.shareDragDrop.isEmpty()) {
				infos.put("general advanced shareDragDrop", this.shareDragDrop);
			}
			if (!this.snapshotFolder.isEmpty()) {
				infos.put("general advanced snapshotFolder", this.snapshotFolder);
			}
			if (!this.shareClipboard.isEmpty()) {
				infos.put("general advanced shareClipboard", this.shareClipboard);
			}
			if (!this.ram.isEmpty()) {
				infos.put("system motherBoard RAM", this.ram);
			}
			if (!this.chipsetType.isEmpty()) {
				infos.put("system motherBoard chipset", this.chipsetType);
			}
			if (!this.pointerSystem.isEmpty()) {
				infos.put("system motherBoard pointerSystem", this.pointerSystem);
			}
			if (!this.activateIoAPIC.isEmpty()) {
				infos.put("system motherBoard activateIOAPIC", this.activateIoAPIC);
			}
			if (!this.internalClockUTC.isEmpty()) {
				infos.put("system motherBoard internalClockUTC", this.internalClockUTC);
			}
			if (!this.nbCPU.isEmpty()) {
				infos.put("system processor nbCPU", this.nbCPU);
			}
			if (!this.allocatedRessouces.isEmpty()) {
				infos.put("system processor allocatedRessources", this.allocatedRessouces);
			}
			if (!this.vRAM.isEmpty()) {
				infos.put("display generalDisplay VRAM", this.vRAM);
			}
			if (!this.monitorCount.isEmpty()) {
				infos.put("display generalDisplay monitorCount", this.monitorCount);
			}
			if (!this.acceleration3d.isEmpty()) {
				infos.put("display generalDisplay 3DAcceleration", this.acceleration3d);
			}
			if (!this.acceleration2d.isEmpty()) {
				infos.put("display generalDisplay 2DAcceleration", this.acceleration2d);
			}
			if (!this.storageController.isEmpty()) {
				infos.put(STORAGE, this.storageController);
			}
			if (!this.mapNetwork.isEmpty()) {
				infos.put(NETWORK, this.mapNetwork);
			}
		} catch (Exception e) {
			Log.warning(e.toString() + " " + e.getMessage() + " " + e.getCause());
		}
		return infos;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> generateHashMap() {
		Map<String, Object> infos = new HashMap<>();
		Map<String, Object> general = new HashMap<>();
		HashMap<String, Object> basic = new HashMap<>();
		if (!this.name.isEmpty()) {
			basic.put("name", this.name);
		}
		if (!this.os.isEmpty()) {
			basic.put("OS", this.os);
		}
		if (!basic.isEmpty()) {
			general.put("basic", basic);
		}
		HashMap<String, Object> advanced = new HashMap<>();
		if (!this.snapshotFolder.isEmpty()) {
			advanced.put("snapshotFolder", this.snapshotFolder);
		}
		if (!this.shareClipboard.isEmpty()) {
			advanced.put("shareClipboard", this.shareClipboard);
		}
		if (!this.shareDragDrop.isEmpty()) {
			advanced.put("shareDragDrop", this.shareDragDrop);
		}
		if (!advanced.isEmpty()) {
			general.put("advanced", advanced);
		}
		if (!this.ram.isEmpty()) {
			infos.put("general", general);
		}
		Map<String, Object> system = new HashMap<>();
		HashMap<String, Object> motherBoard = new HashMap<>();
		if (!this.ram.isEmpty()) {
			motherBoard.put("RAM", this.ram);
		}
		if (!this.bootOrder.isEmpty()) {
			motherBoard.put("BootOrder", this.bootOrder);
		}
		if (!this.chipsetType.isEmpty()) {
			motherBoard.put("chipset", this.chipsetType);
		}
		if (!this.pointerSystem.isEmpty()) {
			motherBoard.put("pointerSystem", this.pointerSystem);
		}
		if (!this.activateIoAPIC.isEmpty()) {
			motherBoard.put("activateIOAPIC", this.activateIoAPIC);
		}
		if (!this.internalClockUTC.isEmpty()) {
			motherBoard.put("internalClockUTC", this.internalClockUTC);
		}
		if (!motherBoard.isEmpty()) {
			system.put("motherBoard", motherBoard);
		}
		HashMap<String, Object> processor = new HashMap<>();
		if (!this.nbCPU.isEmpty()) {
			processor.put("nbCPU", this.nbCPU);
		}
		if (!this.allocatedRessouces.isEmpty()) {
			processor.put("allocatedRessources", this.allocatedRessouces);
		}
		if (!processor.isEmpty()) {
			system.put("processor", processor);
		}
		if (!system.isEmpty()) {
			infos.put("system", system);
		}
		HashMap<String, Object> display = new HashMap<>();
		HashMap<String, Object> generalDisplay = new HashMap<>();
		if (!this.vRAM.isEmpty()) {
			generalDisplay.put("VRAM", this.vRAM);
		}
		if (!this.monitorCount.isEmpty()) {
			generalDisplay.put("monitorCount", this.monitorCount);
		}
		if (!this.acceleration3d.isEmpty()) {
			generalDisplay.put("3DAcceleration", this.acceleration3d);
		}
		if (!this.acceleration2d.isEmpty()) {
			generalDisplay.put("2DAcceleration", this.acceleration2d);
		}
		if (!generalDisplay.isEmpty()) {
			display.put("generalDisplay", generalDisplay);
		}
		if (!display.isEmpty()) {
			infos.put("display", display);
		}
		if (!this.storageController.isEmpty()) {
			infos.put(STORAGE, this.storageController);
		}
		if (!this.mapNetwork.isEmpty()) {
			infos.put(NETWORK, this.mapNetwork);
		}
		infos.put("sharedFolders", this.sharedFolder);
		return infos;
	}

	/**
	 * 
	 * @return
	 */
	public String getStorageTree() {
		String tree = "[";
		if (this.storageController == null) {
			return " ";
		}
		Iterator<Entry<String, Object>> it = this.storageController.entrySet().iterator();
		while (it.hasNext()) {
			Entry<String, Object> elt = it.next();
			if (!CONNECTORS.equals(elt.getKey())) {
				tree += "{";
				@SuppressWarnings("unchecked")
				HashMap<String, Object> ctrl = (HashMap<String, Object>) elt.getValue();
				tree += "\"text\":\"Controller : " + ctrl.get(NAMECONTROLLER).toString() + "\",";

				String node = "";
				Iterator<Entry<String, Object>> it2 = ctrl.entrySet().iterator();

				boolean previous = false;
				while (it2.hasNext()) {

					Entry<String, Object> e = it2.next();
					String key = e.getKey().substring(0, 4);
					if ("atta".equals(key)) {
						if (previous) {
							node += ",";
						}
						@SuppressWarnings("unchecked")
						HashMap<String, Object> attach = (HashMap<String, Object>) e.getValue();
						node += "{\"text\":\"" + attach.get("nameDrive").toString() + "\"}";
						previous = true;
					}
					it2.remove();
				}
				tree += "\"nodes\":[" + node + "]}";
				if (it.hasNext()) {
					tree += ",";
				}
			}
			it.remove();
		}
		return tree + "]";
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, String> getControllerList() {

		Map<String, String> map = new HashMap<>();
		for (Map.Entry<String, Object> elt : this.storageController.entrySet()) {
			@SuppressWarnings("unchecked")
			Map<String, Object> ctrl = (Map<String, Object>) elt.getValue();
			if (!CONNECTORS.equals(elt.getKey())) {
				map.put(ctrl.get("typeBusController").toString(), ctrl.get(NAMECONTROLLER).toString());
			}
		}
		return map;
	}

	/**
	 * 
	 * @return
	 */
	public List<String[]> getStorageToString() {

		List<String[]> list = new ArrayList<>();
		for (Map.Entry<String, Object> elt : this.storageController.entrySet()) {
			String[] controller = new String[8];
			@SuppressWarnings("unchecked")
			HashMap<String, Object> ctrl = (HashMap<String, Object>) elt.getValue();

			controller[0] = ctrl.get(NAMECONTROLLER).toString();
			for (Map.Entry<String, Object> e : ctrl.entrySet()) {
				String key = e.getKey().substring(0, 4);
				if ("atta".equals(key)) {
					@SuppressWarnings("unchecked")
					HashMap<String, Object> attach = (HashMap<String, Object>) e.getValue();

					controller[1] = attach.get("connectedToPort").toString();
					controller[2] = attach.get("formatDrive").toString();
					controller[3] = attach.get("deviceTypeDrive").toString();
					controller[4] = attach.get("pathDrive").toString();
					controller[5] = attach.get("nameDrive").toString();

					controller[6] = Tools.convertSize(Long.parseLong(attach.get("logicalSizeDrive").toString()), true);

					list.add(controller);
				}
			}
		}
		return list;
	}

	/**
	 * 
	 * @param ctrl
	 * @return
	 */
	public String getAvailablePort(String ctrl) {
		int portNo;
		List<Integer> availablePort = new ArrayList<>();

		for (Map.Entry<String, Object> elt : this.storageController.entrySet()) {
			this.operationForAvailablePort(elt, availablePort, ctrl);
		}
		if (!availablePort.isEmpty()) {
			portNo = availablePort.get(0);
		} else {
			return null;
		}
		return Integer.toString(portNo);
	}

	/**
	 * 
	 * @param elt
	 * @param availablePort
	 * @param ctrl
	 */
	private void operationForAvailablePort(Entry<String, Object> elt, List<Integer> availablePort, String ctrl) {
		@SuppressWarnings("unchecked")
		Map<String, Object> controller = (Map<String, Object>) elt.getValue();
		if (ctrl.equals(controller.get("typeBusController").toString())) {
			for (int i = 0; i < (Long) controller.get("nbPortsController"); i++) {
				availablePort.add(i);
			}
			for (Map.Entry<String, Object> e : controller.entrySet()) {
				String key = e.getKey().substring(0, 4);
				if ("atta".equals(key)) {
					@SuppressWarnings("unchecked")
					Map<String, Object> drive = (Map<String, Object>) e.getValue();
					availablePort.remove(Integer.valueOf((String) drive.get("connectedToPort")));
				}
			}
		}
	}

	/**
	 * 
	 * @param typeBus
	 * @param hdd
	 */
	public void createHDD(String typeBus, IMedium hdd) {
		HashMap<String, Object> connector = new HashMap<>();
		HashMap<String, String> ide = new HashMap<>();
		ide.put(TYPEBUS, typeBus);
		connector.put("IDE", ide);
		this.storageController.put(CONNECTORS, connector);

		HashMap<String, Object> drives = new HashMap<>();
		HashMap<String, Object> drive = new HashMap<>();
		drive.put("medium", hdd);
		drive.put(TYPEBUS, typeBus);
		drive.put("port", "0");
		drives.put("drive", drive);
		this.storageController.put("drives", drives);
	}

	/**
	 * 
	 * @param typeBus
	 * @param port
	 * @param hdd
	 */
	public void createCustomHDD(String typeBus, String port, IMedium hdd) {
		HashMap<String, Object> drives = new HashMap<>();
		HashMap<String, Object> drive = new HashMap<>();
		drive.put("medium", hdd);
		drive.put(TYPEBUS, typeBus);
		drive.put("port", port);
		drives.put("drive", drive);
		this.storageController.put("drives", drives);
	}

	/**
	 * 
	 * @param type
	 */
	public void createController(String type) {
		HashMap<String, Object> connector = new HashMap<>();
		HashMap<String, String> ctrl = new HashMap<>();
		ctrl.put(TYPEBUS, type);
		connector.put(type, ctrl);
		this.storageController.put(CONNECTORS, connector);
	}

	/**
	 * 
	 * @param type
	 * @param name
	 */
	public void deleteController(String type, String name) {
		HashMap<String, Object> connector = new HashMap<>();
		HashMap<String, String> ctrl = new HashMap<>();
		ctrl.put(TYPEBUS, type);
		ctrl.put("delete", "true");
		ctrl.put("name", name);
		connector.put(type, ctrl);
		this.storageController.put(CONNECTORS, connector);
	}

	/**
	 * 
	 * @return
	 */
	public List<String> getBootOrderToString() {
		List<String> list = new ArrayList<>();
		for (Map.Entry<String, Object> elt : this.bootOrder.entrySet()) {
			if (!"Null".equals(elt.getValue())) {
				list.add(elt.getValue().toString());
			}
		}
		return list;
	}

	/**
	 * 
	 * @return
	 */
	public List<String> getNetworkAdapter() {
		List<String> list = new ArrayList<>();
		for (Map.Entry<String, Object> elt : this.mapNetwork.entrySet()) {
			@SuppressWarnings("unchecked")
			HashMap<String, Object> adpater = (HashMap<String, Object>) elt.getValue();
			if ( Boolean.valueOf((String)adpater.get(enabled))) {
				String adaptType = adpater.get("adapterType").toString();
				String strAdapt = "Not set " + adaptType;

				switch (adaptType) {
				case "Am79C970A":
					strAdapt = "PCnet-PCI II";
					break;
				case "Am79C973":
					strAdapt = "PCnet-Fast III";
					break;
				case "I82540EM":
					strAdapt = "Intel PRO/1000 MT Desktop";
					break;
				case "I82543GC":
					strAdapt = "Intel PRO/1000 T Server";
					break;
				case "I82545EM":
					strAdapt = "Intel PRO/1000 MT Server";
					break;
				case "virtio-net":
					strAdapt = "Paravirtualized Network";
					break;
				default:
					break;
				}
				list.add(elt.getKey()+" : "+strAdapt + " (" + adpater.get("attachmentType").toString() +" ["+ adpater.get("connectedTo").toString() +"]) ");
			}
		}
		return list;
	}

	/**
	 * 
	 * @return
	 */
	public String getIsRemoteServerEnabled() {
		return this.remoteServer.get(enabled).toString();
	}

	/**
	 * 
	 * @return
	 */
	public String getIsRemoteServerEnabledICO() {
		if (Boolean.valueOf(this.remoteServer.get(enabled).toString())) {
			return FA_CHECK_GREEN;
		} else {
			return FA_TIMES_RED;
		}
	}

	/**
	 * 
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 
	 * @return
	 */
	public String getOs() {
		return os;
	}

	/**
	 * 
	 * @param os
	 */
	public void setOs(String os) {
		this.os = os;
	}

	/**
	 * 
	 * @return
	 */
	public String getSnapshotFolder() {
		return snapshotFolder;
	}

	/**
	 * 
	 * @param snapshotFolder
	 */
	public void setSnapshotFolder(String snapshotFolder) {
		this.snapshotFolder = snapshotFolder;
	}

	/**
	 * 
	 * @return
	 */
	public String getShareClipboard() {
		return shareClipboard;
	}

	/**
	 * 
	 * @return
	 */
	public String getShareClipboardArrow() {
		String arrow;
		switch (this.shareClipboard) {
		case "Disabled":
			arrow = FATIMES + " red";
			break;
		case "HostToGuest":
			arrow = "fa-long-arrow-left green";
			break;
		case "GuestToHost":
			arrow = "fa-long-arrow-right green";
			break;
		case "Bidirectional":
			arrow = "fa-arrows-h green";
			break;
		default:
			arrow = FATIMES + " red";
			break;
		}
		return arrow;
	}

	/**
	 * 
	 * @param shareClipboard
	 */
	public void setShareClipboard(String shareClipboard) {
		this.shareClipboard = shareClipboard;
	}

	/**
	 * 
	 * @return
	 */
	public String getShareDragDrop() {
		return shareDragDrop;
	}

	/**
	 * 
	 * @return
	 */
	public String getShareDragDropArrow() {
		String arrow;
		switch (this.shareDragDrop) {
		case "Disabled":
			arrow = FATIMES + " red";
			break;
		case "HostToGuest":
			arrow = "fa-long-arrow-left green";
			break;
		case "GuestToHost":
			arrow = "fa-long-arrow-right green";
			break;
		case "Bidirectional":
			arrow = "fa-arrows-h green";
			break;
		default:
			arrow = FATIMES + " red";
			break;
		}
		return arrow;
	}

	/**
	 * 
	 * @param shareDragDrop
	 */
	public void setShareDragDrop(String shareDragDrop) {
		this.shareDragDrop = shareDragDrop;
	}

	/**
	 * 
	 * @return
	 */
	public String getRam() {
		return ram;
	}

	/**
	 * 
	 * @param ram
	 */
	public void setRam(String ram) {
		this.ram = ram;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getBootOrder() {
		return bootOrder;
	}

	/**
	 * 
	 * @param bootOrder
	 */
	public void setBootOrder(Map<String, Object> bootOrder) {
		this.bootOrder = (HashMap<String, Object>) bootOrder;
	}

	/**
	 * 
	 * @return
	 */
	public String getChipsetType() {
		return chipsetType;
	}

	/**
	 * 
	 * @param chipsetType
	 */
	public void setChipsetType(String chipsetType) {
		this.chipsetType = chipsetType;
	}

	/**
	 * 
	 * @return
	 */
	public String getPointerSystem() {
		return pointerSystem;
	}

	/**
	 * 
	 * @param pointerSystem
	 */
	public void setPointerSystem(String pointerSystem) {
		this.pointerSystem = pointerSystem;
	}

	/**
	 * 
	 * @return
	 */
	public String getActivateIoAPIC() {
		return activateIoAPIC;
	}

	/**
	 * 
	 * @param activateIoAPIC
	 */
	public void setActivateIoAPIC(String activateIoAPIC) {
		this.activateIoAPIC = activateIoAPIC;
	}

	/**
	 * 
	 * @return
	 */
	public String getInternalClockUTC() {
		return internalClockUTC;
	}

	/**
	 * 
	 * @param internalClockUTC
	 */
	public void setInternalClockUTC(String internalClockUTC) {
		this.internalClockUTC = internalClockUTC;
	}

	/**
	 * 
	 * @return
	 */
	public String getNbCPU() {
		return nbCPU;
	}

	/**
	 * 
	 * @param nbCPU
	 */
	public void setNbCPU(String nbCPU) {
		this.nbCPU = nbCPU;
	}

	/**
	 * 
	 * @return
	 */
	public String getAllocatedRessouces() {
		return allocatedRessouces;
	}

	/**
	 * 
	 * @param allocatedRessouces
	 */
	public void setAllocatedRessouces(String allocatedRessouces) {
		this.allocatedRessouces = allocatedRessouces;
	}

	/**
	 * 
	 * @return
	 */
	public String getvRAM() {
		return vRAM;
	}

	/**
	 * 
	 * @param vRAM
	 */
	public void setvRAM(String vRAM) {
		this.vRAM = vRAM;
	}

	/**
	 * 
	 * @return
	 */
	public String getMonitorCount() {
		return monitorCount;
	}

	/**
	 * 
	 * @param monitorCount
	 */
	public void setMonitorCount(String monitorCount) {
		this.monitorCount = monitorCount;
	}

	/**
	 * 
	 * @return
	 */
	public String getAcceleration3d() {
		return acceleration3d;
	}

	/**
	 * 
	 * @return
	 */
	public String getAcceleration3dICO() {
		if (Boolean.valueOf(acceleration3d)) {
			return FA_CHECK_GREEN;
		} else {
			return FA_TIMES_RED;
		}
	}

	/**
	 * 
	 * @param acceleration3d
	 */
	public void setAcceleration3d(String acceleration3d) {
		this.acceleration3d = acceleration3d;
	}

	/**
	 * 
	 * @return
	 */
	public String getAcceleration2d() {
		return acceleration2d;
	}

	/**
	 * 
	 * @return
	 */
	public String getAcceleration2dICO() {
		if (Boolean.valueOf(acceleration2d)) {
			return FA_CHECK_GREEN;
		} else {
			return FA_TIMES_RED;
		}
	}

	/**
	 * 
	 * @param acceleration2d
	 */
	public void setAcceleration2d(String acceleration2d) {
		this.acceleration2d = acceleration2d;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getStorageController() {
		return storageController;
	}

	/**
	 * 
	 * @param storageController
	 */
	public void setStorageController(Map<String, Object> storageController) {
		this.storageController = (HashMap<String, Object>) storageController;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getNetwork() {
		return mapNetwork;
	}

	/**
	 * 
	 * @param network
	 */
	public void setNetwork(Map<String, Object> network) {
		this.mapNetwork = network;
	}

	/**
	 * 
	 * @param sharedFolder
	 */
	public void setSharedFolder(Map<String, Object> sharedFolder) {
		this.sharedFolder = (HashMap<String, Object>) sharedFolder;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getSharedFolder() {
		return this.sharedFolder;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getRemoteServer() {
		return remoteServer;
	}

	/**
	 * 
	 * @param remoteServer
	 */
	public void setRemoteServer(Map<String, Object> remoteServer) {
		this.remoteServer = (HashMap<String, Object>) remoteServer;
	}
}
