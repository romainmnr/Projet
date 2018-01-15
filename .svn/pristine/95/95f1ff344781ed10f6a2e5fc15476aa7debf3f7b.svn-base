package rwb.java.vb.bo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.virtualbox_5_0.AuthType;
import org.virtualbox_5_0.BitmapFormat;
import org.virtualbox_5_0.ChipsetType;
import org.virtualbox_5_0.ClipboardMode;
import org.virtualbox_5_0.DeviceType;
import org.virtualbox_5_0.DnDMode;
import org.virtualbox_5_0.IBIOSSettings;
import org.virtualbox_5_0.IConsole;
import org.virtualbox_5_0.IDisplay;
import org.virtualbox_5_0.IMachine;
import org.virtualbox_5_0.IMedium;
import org.virtualbox_5_0.IMediumAttachment;
import org.virtualbox_5_0.INetworkAdapter;
import org.virtualbox_5_0.IProgress;
import org.virtualbox_5_0.ISession;
import org.virtualbox_5_0.ISharedFolder;
import org.virtualbox_5_0.IStorageController;
import org.virtualbox_5_0.IVRDEServer;
import org.virtualbox_5_0.IVirtualBox;
import org.virtualbox_5_0.MachineState;
import org.virtualbox_5_0.NetworkAdapterPromiscModePolicy;
import org.virtualbox_5_0.NetworkAdapterType;
import org.virtualbox_5_0.NetworkAttachmentType;
import org.virtualbox_5_0.PointingHIDType;
import org.virtualbox_5_0.SessionState;
import org.virtualbox_5_0.StorageBus;
import org.virtualbox_5_0.VirtualBoxManager;

public class MachineBOTest {

	@SuppressWarnings("unused")
	private VirtualBoxManager vbmMock;
	@SuppressWarnings("unused")
	private VirtualBoxBO vbox;
	@SuppressWarnings("unused")
	private MachineBO machineLinked;
	private MachineBO machineEmpty;

	@Before
	public void setUp() {
		// this.vbox = new VirtualBoxBO(new VirtualBoxDAO("192.168.4.201",
		// 18083, "etudiant", "network"));
		this.vbmMock = Mockito.mock(VirtualBoxManager.class);

		// HashmapBO settings = new HashmapBO();
		// settings.setName("MachineTest2");
		// settings.setOs("Linux_64");
		// vbox.createMachine(settings.generateConfigHashMap(), "MachineTest2");
		// this.machineLinked = vbox.getMachineBO("MachineTest2");
		this.machineEmpty = new MachineBO();

	}

	@After
	public void tearDown() {
		
	}

	// @Test
	// public void machineBoTest(){
	// VirtualBoxManager vbmMock = Mockito.mock(VirtualBoxManager.class);
	// ISession sessionMock = Mockito.mock(ISession.class);
	//
	// Mockito.when(vbmMock.getSessionObject()).thenReturn(sessionMock);
	//
	// MachineBO machineBO = new MachineBO(vbmMock, "nomTest");
	// }
	

	@Test
	public void getStateTest() {
		IMachine machineMock = Mockito.mock(IMachine.class);

		machineEmpty.setMachine(machineMock);

		Mockito.when(machineMock.getState()).thenReturn(MachineState.PoweredOff);

		Assert.assertEquals("Etat de machine : ", "PoweredOff", machineEmpty.getState());
	}

	@Test
	public void accesseurAttributsTest() {
		IMachine machine = Mockito.mock(IMachine.class);
		VirtualBoxManager vbm = Mockito.mock(VirtualBoxManager.class);
		IVirtualBox vbox = Mockito.mock(IVirtualBox.class);
		ISession session = Mockito.mock(ISession.class);
		String name = "name";
		String osType = "osType";

		machineEmpty.setSession(session);
		machineEmpty.setVbm(vbm);
		machineEmpty.setVbox(vbox);
		machineEmpty.setMachine(machine);
		machineEmpty.setName(name);
		machineEmpty.setOsType(osType);

		Assert.assertEquals(session, machineEmpty.getSession());
		Assert.assertEquals(vbm, machineEmpty.getVbm());
		Assert.assertEquals(vbox, machineEmpty.getVbox());
		Assert.assertEquals(machine, machineEmpty.getMachine());
		Assert.assertEquals(name, machineEmpty.getName());
		Assert.assertEquals(osType, machineEmpty.getOsType());

	}

	@Test
	public void powerChangeTest() {
		IMachine machineMock = Mockito.mock(IMachine.class);
		ISession sessionMock = Mockito.mock(ISession.class);
		IConsole consoleMock = Mockito.mock(IConsole.class);
		IProgress progressMock = Mockito.mock(IProgress.class);
		VirtualBoxManager vbmMock = Mockito.mock(VirtualBoxManager.class);
		
		Mockito.when(machineMock.getState()).thenReturn(MachineState.PoweredOff).thenReturn(MachineState.Running)
				.thenReturn(MachineState.PoweredOff).thenReturn(MachineState.Running).thenReturn(MachineState.Paused)
				.thenReturn(MachineState.Running);
		Mockito.when(machineMock.launchVMProcess(sessionMock, "headless", null)).thenReturn(progressMock);
		Mockito.when(sessionMock.getConsole()).thenReturn(consoleMock);
		Mockito.when(consoleMock.powerDown()).thenReturn(progressMock);
		Mockito.when(vbmMock.getSessionObject()).thenReturn(sessionMock);
		
		this.machineEmpty.setVbm(vbmMock);
		this.machineEmpty.setMachine(machineMock);
		this.machineEmpty.setSession(sessionMock);

		this.machineEmpty.powerUp();
		this.machineEmpty.powerDownForced();

		this.machineEmpty.powerUp();
		this.machineEmpty.pause();
		this.machineEmpty.unPause();
		this.machineEmpty.powerDown();

		Assert.assertTrue(true); // TODO

	}

	@Test
	public void modifMachineTest() {
		ISession session = Mockito.mock(ISession.class);
		IMachine machineMutableMock = Mockito.mock(IMachine.class);
		IMachine machineMock = Mockito.mock(IMachine.class);

		Mockito.when(session.getMachine()).thenReturn(machineMutableMock);

		IBIOSSettings biosSettings = Mockito.mock(IBIOSSettings.class);
		IVRDEServer server = Mockito.mock(IVRDEServer.class);
		INetworkAdapter adapter = Mockito.mock(INetworkAdapter.class);

		IStorageController controller = Mockito.mock(IStorageController.class);
		List<IStorageController> storageControlers = new ArrayList<IStorageController>();
		// storageControlers.add(controller);

		Mockito.when(controller.getBus()).thenReturn(StorageBus.IDE);
		Mockito.when(controller.getName()).thenReturn("nameController");
		Mockito.when(controller.getPortCount()).thenReturn((long) 2);

		List<ISharedFolder> sharedFolders = new ArrayList<ISharedFolder>();

		Mockito.when(adapter.getPromiscModePolicy()).thenReturn(NetworkAdapterPromiscModePolicy.AllowAll);
		for (long i = 0; i < 4; i++) {
			Mockito.when(machineMutableMock.getNetworkAdapter(i)).thenReturn(adapter);
		}
		Mockito.when(machineMutableMock.getSharedFolders()).thenReturn(sharedFolders);
		Mockito.when(machineMutableMock.getBIOSSettings()).thenReturn(biosSettings);
		Mockito.when(machineMutableMock.getVRDEServer()).thenReturn(server);
		Mockito.when(machineMutableMock.getStorageControllers()).thenReturn(storageControlers);

		for (long i = 0; i < 4; i++) {
			Mockito.when(machineMock.getNetworkAdapter(i)).thenReturn(adapter);
		}
		Mockito.when(machineMock.getSharedFolders()).thenReturn(sharedFolders);
		Mockito.when(machineMock.getStorageControllers()).thenReturn(storageControlers);
		Mockito.when(machineMock.getBIOSSettings()).thenReturn(biosSettings);
		Mockito.when(machineMock.getVRDEServer()).thenReturn(server);

		machineEmpty.setMachine(machineMock);
		machineEmpty.setSession(session);

		HashMap<String, Object> settings = new HashMap<String, Object>();
		settings.put("general basic Name", "name");
		settings.put("general basic OS", "os");
		settings.put("general advanced shareDragDrop", DnDMode.Bidirectional);
		settings.put("general advanced snapshotFolder", "snapshotFolder");
		settings.put("general advanced shareClipboard", ClipboardMode.Bidirectional);
		settings.put("system acceleration acceleration3D", true);
		settings.put("system motherBoard RAM", (long) 1024);
		settings.put("system motherBoard chipset", ChipsetType.ICH9);
		settings.put("system motherBoard pointerSystem", PointingHIDType.USBMouse);
		settings.put("system motherBoard activateIOAPIC", true);
		settings.put("system motherBoard internalClockUTC", true);
		settings.put("system processor nbCPU", (long) 4);
		settings.put("system processor allocatedRessources", (long) 1024);
		settings.put("display generalDisplay VRAM", (long) 2048);
		settings.put("display generalDisplay monitorCount", (long) 2);
		settings.put("display generalDisplay 3DAcceleration", true);
		settings.put("display generalDisplay 2DAcceleration", true);
		settings.put("display remoteServer allowMultiConnection", true);
		settings.put("display remoteServer authLibrary", "authLibrary");
		settings.put("display remoteServer authTimeout", (long) 1000);
		settings.put("display remoteServer authType", AuthType.External);
		settings.put("display remoteServer enables", true);
		settings.put("display remoteServer reuseSingleConnection", true);
		settings.put("display remoteServer other", "value");

		// Mockito.when(machineMock.getName()).thenReturn(machineMutableMock.getName());
		// Mockito.when(machineMock.getOSTypeId()).thenReturn(machineMutableMock.getOSTypeId());
		// Mockito.when(machineMock.getSnapshotFolder()).thenReturn(machineMutableMock.getSnapshotFolder());
		// Mockito.when(machineMock.getClipboardMode()).thenReturn(machineMutableMock.getClipboardMode());
		// Mockito.when(machineMock.getDnDMode()).thenReturn(machineMutableMock.getDnDMode());
		// Mockito.when(machineMock.getMemorySize()).thenReturn(machineMutableMock.getMemorySize());
		// Mockito.when(machineMock.getBootOrder((long)
		// 1)).thenReturn(machineMutableMock.getBootOrder((long) 1));
		// Mockito.when(machineMock.getBootOrder((long)
		// 2)).thenReturn(machineMutableMock.getBootOrder((long) 2));
		// Mockito.when(machineMock.getBootOrder((long)
		// 3)).thenReturn(machineMutableMock.getBootOrder((long) 3));
		// Mockito.when(machineMock.getBootOrder((long)
		// 4)).thenReturn(machineMutableMock.getBootOrder((long) 4));
		// Mockito.when(machineMock.getChipsetType()).thenReturn(machineMutableMock.getChipsetType());
		// Mockito.when(machineMock.getPointingHIDType()).thenReturn(machineMutableMock.getPointingHIDType());
		// Mockito.when(machineMock.getBIOSSettings()).thenReturn(machineMutableMock.getBIOSSettings());
		// Mockito.when(machineMock.getRTCUseUTC()).thenReturn(machineMutableMock.getRTCUseUTC());
		// Mockito.when(machineMock.getCPUCount()).thenReturn(machineMutableMock.getCPUCount());
		// Mockito.when(machineMock.getCPUExecutionCap()).thenReturn(machineMutableMock.getCPUExecutionCap());
		// Mockito.when(machineMock.getVRAMSize()).thenReturn(machineMutableMock.getVRAMSize());
		// Mockito.when(machineMock.getMonitorCount()).thenReturn(machineMutableMock.getMonitorCount());
		// Mockito.when(machineMock.getAccelerate3DEnabled()).thenReturn(machineMutableMock.getAccelerate3DEnabled());
		// Mockito.when(machineMock.getAccelerate2DVideoEnabled()).thenReturn(machineMutableMock.getAccelerate2DVideoEnabled());
		// Mockito.when(machineMock.getVRDEServer()).thenReturn(machineMutableMock.getVRDEServer());

		// Mockito.when(machineMock.getName()).thenCallRealMethod();
		// Mockito.when(machineMock.getOSTypeId()).thenCallRealMethod();
		// Mockito.when(machineMock.getSnapshotFolder()).thenCallRealMethod();
		// Mockito.when(machineMock.getClipboardMode()).thenCallRealMethod();
		// Mockito.when(machineMock.getDnDMode()).thenCallRealMethod();
		// Mockito.when(machineMock.getMemorySize()).thenCallRealMethod();
		// Mockito.when(machineMock.getBootOrder((long)1)).thenCallRealMethod();
		// Mockito.when(machineMock.getBootOrder((long)2)).thenCallRealMethod();
		// Mockito.when(machineMock.getBootOrder((long)3)).thenCallRealMethod();
		// Mockito.when(machineMock.getBootOrder((long)4)).thenCallRealMethod();
		// Mockito.when(machineMock.getChipsetType()).thenCallRealMethod();
		// Mockito.when(machineMock.getPointingHIDType()).thenCallRealMethod();
		// Mockito.when(machineMock.getRTCUseUTC()).thenCallRealMethod();
		// Mockito.when(machineMock.getCPUCount()).thenCallRealMethod();
		// Mockito.when(machineMock.getCPUExecutionCap()).thenCallRealMethod();
		// Mockito.when(machineMock.getVRAMSize()).thenCallRealMethod();
		// Mockito.when(machineMock.getMonitorCount()).thenCallRealMethod();
		// Mockito.when(machineMock.getAccelerate3DEnabled()).thenCallRealMethod();
		// Mockito.when(machineMock.getAccelerate2DVideoEnabled()).thenCallRealMethod();

		Assert.assertTrue(machineEmpty.modifMachine(settings));
	}

	@Test
	public void getInfosTest() {
		IMachine machineMock = Mockito.mock(IMachine.class);
		Mockito.when(machineMock.getName()).thenReturn("name");
		Mockito.when(machineMock.getOSTypeId()).thenReturn("OS");
		Mockito.when(machineMock.getSnapshotFolder()).thenReturn("snapshotFolder");
		Mockito.when(machineMock.getClipboardMode()).thenReturn(ClipboardMode.Bidirectional);
		Mockito.when(machineMock.getDnDMode()).thenReturn(DnDMode.Bidirectional);
		Mockito.when(machineMock.getMemorySize()).thenReturn((long) 1024);
		Mockito.when(machineMock.getBootOrder((long) 1)).thenReturn(DeviceType.DVD);
		Mockito.when(machineMock.getBootOrder((long) 2)).thenReturn(DeviceType.Floppy);
		Mockito.when(machineMock.getBootOrder((long) 3)).thenReturn(DeviceType.HardDisk);
		Mockito.when(machineMock.getBootOrder((long) 4)).thenReturn(DeviceType.USB);
		Mockito.when(machineMock.getChipsetType()).thenReturn(ChipsetType.ICH9);
		Mockito.when(machineMock.getPointingHIDType()).thenReturn(PointingHIDType.None);

		IBIOSSettings biosSettings = Mockito.mock(IBIOSSettings.class);
		Mockito.when(biosSettings.getIOAPICEnabled()).thenReturn(true);
		Mockito.when(machineMock.getBIOSSettings()).thenReturn(biosSettings);
		Mockito.when(machineMock.getRTCUseUTC()).thenReturn(true);
		Mockito.when(machineMock.getCPUCount()).thenReturn((long) 2);
		Mockito.when(machineMock.getCPUExecutionCap()).thenReturn((long) 2);
		Mockito.when(machineMock.getVRAMSize()).thenReturn((long) 2048);
		Mockito.when(machineMock.getMonitorCount()).thenReturn((long) 2);
		Mockito.when(machineMock.getAccelerate3DEnabled()).thenReturn(true);
		Mockito.when(machineMock.getAccelerate2DVideoEnabled()).thenReturn(true);

		IVRDEServer server = Mockito.mock(IVRDEServer.class);
		Mockito.when(machineMock.getVRDEServer()).thenReturn(server);
		Mockito.when(server.getAllowMultiConnection()).thenReturn(true);
		Mockito.when(server.getAuthLibrary()).thenReturn("authLibrary");
		Mockito.when(server.getAuthTimeout()).thenReturn((long) 1000);
		Mockito.when(server.getAuthType()).thenReturn(AuthType.External);
		Mockito.when(server.getEnabled()).thenReturn(true);
		Mockito.when(server.getReuseSingleConnection()).thenReturn(true);
		String[] properties = { "properties" };
		Mockito.when(server.getVRDEProperties()).thenReturn(Arrays.asList(properties));

		INetworkAdapter adapter = Mockito.mock(INetworkAdapter.class);
		Mockito.when(adapter.getPromiscModePolicy()).thenReturn(NetworkAdapterPromiscModePolicy.AllowAll);
		for (long i = 0; i < 4; i++) {
			Mockito.when(machineMock.getNetworkAdapter(i)).thenReturn(adapter);
		}
		Mockito.when(adapter.getGenericDriver()).thenReturn("genericDriver");
		Mockito.when(adapter.getAdapterType()).thenReturn(NetworkAdapterType.Am79C970A);
		Mockito.when(adapter.getAttachmentType()).thenReturn(NetworkAttachmentType.Bridged);
		Mockito.when(adapter.getCableConnected()).thenReturn(true);
		Mockito.when(adapter.getEnabled()).thenReturn(true);
		Mockito.when(adapter.getMACAddress()).thenReturn("genericDriver");
		Mockito.when(adapter.getPromiscModePolicy()).thenReturn(NetworkAdapterPromiscModePolicy.AllowAll);
		Mockito.when(adapter.getNATNetwork()).thenReturn("natnetwork");
		Mockito.when(adapter.getBridgedInterface()).thenReturn("bridgedInterface");
		Mockito.when(adapter.getHostOnlyInterface()).thenReturn("hostOnlyInterface");

		ISharedFolder sharedFolder = Mockito.mock(ISharedFolder.class);
		List<ISharedFolder> sharedFolders = new ArrayList<ISharedFolder>();
		sharedFolders.add(sharedFolder);
		Mockito.when(sharedFolder.getName()).thenReturn("name");
		Mockito.when(sharedFolder.getHostPath()).thenReturn("path");
		Mockito.when(sharedFolder.getAutoMount()).thenReturn(true);
		Mockito.when(sharedFolder.getWritable()).thenReturn(true);
		Mockito.when(machineMock.getSharedFolders()).thenReturn(sharedFolders);

		IStorageController controller = Mockito.mock(IStorageController.class);
		List<IStorageController> storageControlers = new ArrayList<IStorageController>();
		storageControlers.add(controller);

		Mockito.when(controller.getBus()).thenReturn(StorageBus.IDE);
		Mockito.when(controller.getName()).thenReturn("nameController");
		Mockito.when(controller.getPortCount()).thenReturn((long) 2);

		IMediumAttachment attachment = Mockito.mock(IMediumAttachment.class);
		List<IMediumAttachment> attachments = new ArrayList<IMediumAttachment>();
		attachments.add(attachment);

		IMedium medium = Mockito.mock(IMedium.class);
		Mockito.when(attachment.getMedium()).thenReturn(medium);
		Mockito.when(attachment.getPort()).thenReturn(18759);
		Mockito.when(medium.getName()).thenReturn("nameDrive");
		Mockito.when(medium.getFormat()).thenReturn("formatDrive");
		Mockito.when(medium.getDeviceType()).thenReturn(DeviceType.DVD);
		Mockito.when(medium.getLocation()).thenReturn("pathDrive");
		Mockito.when(medium.getMediumFormat()).thenReturn(null);
		Mockito.when(medium.getLogicalSize()).thenReturn((long) 1024);
		Mockito.when(medium.getSize()).thenReturn((long) 1024);

		machineEmpty.setMachine(machineMock);

		machineEmpty.createInfosMachine();

		this.getInfosGeneralTest(machineEmpty);
		this.getInfosSystemTest(machineEmpty);
		this.getInfosDisplayTest(machineEmpty);
		this.getInfosAutresTest(machineEmpty);

	}

	private void getInfosGeneralTest(MachineBO machineBO) {

		HashMap<String, Object> general = new HashMap<String, Object>();
		// -->Basic
		HashMap<String, Object> basic = new HashMap<String, Object>();
		basic.put("name", "name");
		basic.put("OS", "OS");
		general.put("basic", basic);
		// -->Advanced
		HashMap<String, Object> advanced = new HashMap<String, Object>();
		advanced.put("snapshotFolder", "snapshotFolder");
		advanced.put("shareClipboard", ClipboardMode.Bidirectional);
		advanced.put("shareDragDrop", DnDMode.Bidirectional);
		general.put("advanced", advanced);

		Assert.assertEquals(general, machineBO.getInfos().get("general"));
	}

	private void getInfosSystemTest(MachineBO machineBO) {
		// SYSTEM
		HashMap<String, Object> system = new HashMap<String, Object>();
		// -->MotherBoard
		HashMap<String, Object> motherBoard = new HashMap<String, Object>();
		motherBoard.put("RAM", (long) 1024);
		HashMap<String, Object> boot = new HashMap<String, Object>();
		boot.put("1", DeviceType.DVD);
		boot.put("2", DeviceType.Floppy);
		boot.put("3", DeviceType.HardDisk);
		boot.put("4", DeviceType.USB);
		motherBoard.put("BootOrder", boot);
		motherBoard.put("chipset", ChipsetType.ICH9);
		motherBoard.put("pointerSystem", PointingHIDType.None);
		motherBoard.put("activateIOAPIC", true);
		// basic.put("activateEFI", this.machine.getBIOSSettings().getEFI());
		motherBoard.put("internalClockUTC", true);
		system.put("motherBoard", motherBoard);
		// -->Processor
		HashMap<String, Object> processor = new HashMap<String, Object>();
		processor.put("nbCPU", (long) 2);
		processor.put("allocatedRessources", (long) 2);
		// advanced.put("PAENX", this.vbox.getHost());
		system.put("processor", processor);
		// -->Acceleration
		HashMap<String, Object> acceleration = new HashMap<String, Object>();
		system.put("acceleration", acceleration);

		Assert.assertEquals(system, machineBO.getInfos().get("system"));
	}

	private void getInfosDisplayTest(MachineBO machineBO) {
		// DISPLAY
		HashMap<String, Object> display = new HashMap<String, Object>();
		// -->Basic
		HashMap<String, Object> generalDisplay = new HashMap<String, Object>();
		generalDisplay.put("VRAM", (long) 2048);
		generalDisplay.put("monitorCount", (long) 2);
		// generalDisplay.put("scaleFactor", this.machine.get);
		generalDisplay.put("3DAcceleration", true);
		generalDisplay.put("2DAcceleration", true);
		display.put("generalDisplay", generalDisplay);
		// -->Remote Display
		HashMap<String, Object> remoteServer = new HashMap<String, Object>();
		remoteServer.put("allowMultiConnection", true);
		remoteServer.put("authLibrary", "authLibrary");
		remoteServer.put("authTimeout", (long) 1000);
		remoteServer.put("enabled", true);
		remoteServer.put("reuseSingleConnection", true);
		String[] properties = { "properties" };
		remoteServer.put("VRDEProperties", Arrays.asList(properties));
		remoteServer.put("authtype", AuthType.External);

		display.put("remoteServer", remoteServer);

		Assert.assertEquals(display, machineBO.getInfos().get("display"));
	}

	// TODO
	public void getInfosAutresTest(MachineBO machineBO) {
		HashMap<String, Object> hashMapVoid = new HashMap<String, Object>();

		Assert.assertEquals(hashMapVoid, machineBO.getInfos().get("storage"));
		Assert.assertEquals(hashMapVoid, machineBO.getInfos().get("audio"));

		HashMap<String, Object> network = new HashMap<String, Object>();
		for (long i = 0; i < 4; i++) {
			HashMap<String, Object> adapter = new HashMap<String, Object>();
			adapter.put("cableConnected", true);
			adapter.put("connectedTo	", "bridgedInterface");
			adapter.put("MACAdress", "genericDriver");
			adapter.put("promiscuousMode", NetworkAdapterPromiscModePolicy.AllowAll);
			adapter.put("attachmentType", NetworkAttachmentType.Bridged);
			adapter.put("nameNATconnectedTo", "natnetwork");
			adapter.put("adapterName", "genericDriver");
			adapter.put("hostOnlyInterface", "hostOnlyInterface");
			adapter.put("adapterType", NetworkAdapterType.Am79C970A);
			adapter.put("enabled", true);
			network.put("adapter" + i, adapter);
		}
		Assert.assertEquals(network, machineBO.getInfos().get("network"));

		HashMap<String, Object> sharedFolders = new HashMap<String, Object>();
		HashMap<String, Object> sharedFolder = new HashMap<String, Object>();
		sharedFolder.put("path", "path");
		sharedFolder.put("automount", true);
		sharedFolder.put("name", "name");
		sharedFolder.put("writable", true);
		sharedFolders.put("0", sharedFolder);

		Assert.assertEquals(sharedFolders, machineBO.getInfos().get("sharedFolders"));

		// STORAGE
		// AUDIO
		// NETWORK
		// SHAREDFOLDERS
	}

	@Test
	public void getPreviewTest() {
		ISession sessionMock = Mockito.mock(ISession.class);
		IConsole consoleMock = Mockito.mock(IConsole.class);
		IDisplay displayMock = Mockito.mock(IDisplay.class);
		IMachine machineMock = Mockito.mock(IMachine.class);

		byte[] arry = { 0, 1, 0, 1, 1 };

		Mockito.when(sessionMock.getConsole()).thenReturn(consoleMock);
		Mockito.when(consoleMock.getDisplay()).thenReturn(displayMock);
		Mockito.when(machineMock.getMonitorCount()).thenReturn((long) 1);
		Mockito.when(displayMock.takeScreenShotToArray((long) 1, (long) 640, (long) 480, BitmapFormat.PNG))
				.thenReturn(arry);

		Assert.assertEquals(arry, arry);
	}

	@Test
	public void getSessionStateTest() {
		IMachine machineMock = Mockito.mock(IMachine.class);
		Mockito.when(machineMock.getSessionState()).thenReturn(SessionState.Locked);

		machineEmpty.setMachine(machineMock);

		Assert.assertEquals(SessionState.Locked, machineEmpty.getSessionState());
	}

}