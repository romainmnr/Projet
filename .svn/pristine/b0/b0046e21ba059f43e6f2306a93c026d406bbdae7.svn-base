package rwb.java.divers;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.virtualbox_5_0.AuthType;
import org.virtualbox_5_0.ChipsetType;
import org.virtualbox_5_0.ClipboardMode;
import org.virtualbox_5_0.DeviceType;
import org.virtualbox_5_0.DnDMode;
import org.virtualbox_5_0.IMediumAttachment;
import org.virtualbox_5_0.INetworkAdapter;
import org.virtualbox_5_0.ISharedFolder;
import org.virtualbox_5_0.IStorageController;
import org.virtualbox_5_0.IVRDEServer;
import org.virtualbox_5_0.PointingHIDType;


public class HashmapBOTest {
	
	HashmapBO hashmap = null;

	@Before
	public void setUp() {

		this.hashmap = new HashmapBO();

	}

	@After
	public void tearDown() {
		//nothing 
	}
	
	
	@Test
	public void accesseurAttributsTest() {
		this.hashmap.setName("name"); 
		Assert.assertEquals("Name : ", "name", this.hashmap.getName());
		this.hashmap.setOs("linux"); 
		Assert.assertEquals("os : ", "linux", this.hashmap.getOs());
		this.hashmap.setSnapshotFolder("/home/etudiant/"); 
		Assert.assertEquals("Snapshot folder : ", "/home/etudiant/", this.hashmap.getSnapshotFolder());
		this.hashmap.setShareClipboard("Bidirectional"); 
		Assert.assertEquals(" share clipboard : ", "Bidirectional", this.hashmap.getShareClipboard());
		this.hashmap.setShareDragDrop("Bidirectional"); 
		Assert.assertEquals(" share drag n drop : ", "Bidirectional", this.hashmap.getShareDragDrop());
		this.hashmap.setRam("128"); 
		Assert.assertEquals(" ram : ", "128", this.hashmap.getRam());
		this.hashmap.setChipsetType("PXII"); 
		Assert.assertEquals(" chipset : ", "PXII", this.hashmap.getChipsetType());
		this.hashmap.setPointerSystem("PS/2 Mouse"); 
		Assert.assertEquals(" Pointer sys : ", "PS/2 Mouse", this.hashmap.getPointerSystem());
		this.hashmap.setActivateIoAPIC("true"); 
		Assert.assertEquals(" IO APIC : ", "true", this.hashmap.getActivateIoAPIC());
		this.hashmap.setInternalClockUTC("true"); 
		Assert.assertEquals(" Internal clock : ", "true", this.hashmap.getInternalClockUTC());
		this.hashmap.setNbCPU("2"); 
		Assert.assertEquals(" cpu : ", "2", this.hashmap.getNbCPU());
		this.hashmap.setAllocatedRessouces("100"); 
		Assert.assertEquals(" ressources : ", "100", this.hashmap.getAllocatedRessouces());
		this.hashmap.setvRAM("128"); 
		Assert.assertEquals(" Vram : ", "128", this.hashmap.getvRAM());
		this.hashmap.setMonitorCount("1"); 
		Assert.assertEquals(" monitor count : ", "1", this.hashmap.getMonitorCount()); 
		this.hashmap.setAcceleration2d("true"); 
		Assert.assertEquals("Accélération 2d: ", "true", this.hashmap.getAcceleration2d());
		this.hashmap.setAcceleration3d("true"); 
		Assert.assertEquals("Accélération 3d: ", "true", this.hashmap.getAcceleration3d());
		
		HashMap<String, Object> storage = new HashMap<>();
		storage.put("IDE", "IDE controller");
		storage.put("SATA", "SATA controller");
		this.hashmap.setStorageController(storage); 
		Assert.assertEquals("Storage controller : ", storage, this.hashmap.getStorageController());
		
		HashMap<String, Object> network = new HashMap<>();
		network.put("Adaptater1", "Nat intel ");
		network.put("Adaptater2", "Bridge intel ");
		this.hashmap.setNetwork(network); 
		Assert.assertEquals("Storage controller : ", network, this.hashmap.getNetwork());
		
		HashMap<String, Object> remoteServer = new HashMap<>();
		remoteServer.put("port", "3309");
		remoteServer.put("enabled", "true");
		this.hashmap.setRemoteServer(remoteServer); 
		Assert.assertEquals("Remote server : ", remoteServer, this.hashmap.getRemoteServer());
		
		
		HashMap<String, Object> bootOrder = new HashMap<>();
		bootOrder.put("1", "Floppy");
		bootOrder.put("2", "DVD");
		this.hashmap.setBootOrder(bootOrder); 
		Assert.assertEquals("Boot order: ", bootOrder, this.hashmap.getBootOrder());
		
		HashMap<String, Object> shareFolder = new HashMap<>();
		shareFolder.put("folder1", "/home/etudiant/share/"); 
		this.hashmap.setSharedFolder(shareFolder); 
		Assert.assertEquals("share folder : ", shareFolder, this.hashmap.getSharedFolder());
		
		Assert.assertEquals("Acceleration 2d ico :","fa-check green", this.hashmap.getAcceleration2dICO());
		Assert.assertEquals("Acceleration 3d ico :","fa-check green", this.hashmap.getAcceleration3dICO());
	
		this.hashmap.setAcceleration3d("false"); 
		this.hashmap.setAcceleration2d("false"); 
		Assert.assertEquals("Acceleration 2d ico :","fa-times red", this.hashmap.getAcceleration2dICO());
		Assert.assertEquals("Acceleration 3d ico :","fa-times red", this.hashmap.getAcceleration3dICO());
	
		
		Assert.assertEquals("getIsRemoteServerEnabled :", "true", this.hashmap.getIsRemoteServerEnabled());
		Assert.assertEquals("getIsRemoteServerEnabledICO  :", "fa-check green", this.hashmap.getIsRemoteServerEnabledICO());
		
		remoteServer.clear();
		remoteServer.put("enabled", "false");
		this.hashmap.setRemoteServer(remoteServer); 
		Assert.assertEquals("getIsRemoteServerEnabled :", "false", this.hashmap.getIsRemoteServerEnabled());
		Assert.assertEquals("getIsRemoteServerEnabledICO  :", "fa-times red", this.hashmap.getIsRemoteServerEnabledICO());
		
		
		this.hashmap.setShareClipboard("Disabled"); 
		this.hashmap.setShareDragDrop("Disabled"); 
		Assert.assertEquals("getShareClipboardArrow :", "fa-times red", this.hashmap.getShareClipboardArrow());
		Assert.assertEquals("getShareDragDropArrow  :", "fa-times red", this.hashmap.getShareDragDropArrow());
		this.hashmap.setShareClipboard("HostToGuest"); 
		this.hashmap.setShareDragDrop("HostToGuest"); 
		Assert.assertEquals("getShareClipboardArrow :", "fa-long-arrow-left green", this.hashmap.getShareClipboardArrow());
		Assert.assertEquals("getShareDragDropArrow  :", "fa-long-arrow-left green", this.hashmap.getShareDragDropArrow());
		this.hashmap.setShareClipboard("GuestToHost"); 
		this.hashmap.setShareDragDrop("GuestToHost"); 
		Assert.assertEquals("getShareClipboardArrow :", "fa-long-arrow-right green", this.hashmap.getShareClipboardArrow());
		Assert.assertEquals("getShareDragDropArrow  :", "fa-long-arrow-right green", this.hashmap.getShareDragDropArrow());
		this.hashmap.setShareClipboard("Bidirectional"); 
		this.hashmap.setShareDragDrop("Bidirectional"); 
		Assert.assertEquals("getShareClipboardArrow :", "fa-arrows-h green", this.hashmap.getShareClipboardArrow());
		Assert.assertEquals("getShareDragDropArrow  :", "fa-arrows-h green", this.hashmap.getShareDragDropArrow());
		this.hashmap.setShareClipboard(""); 
		this.hashmap.setShareDragDrop(""); 
		Assert.assertEquals("getShareClipboardArrow :", "fa-times red", this.hashmap.getShareClipboardArrow());
		Assert.assertEquals("getShareDragDropArrow  :", "fa-times red", this.hashmap.getShareDragDropArrow());
	}
	
	@Test
	public void generateConfigHashMapTest() {
		HashMap<String, Object> infos = new HashMap<>();
			
			infos.put("general basic Name", "name");		
			infos.put("general basic OS", "linux");			
			
			infos.put("general advanced shareDragDrop", "Bidirectional");		
			infos.put("general advanced snapshotFolder", "/home/etudiant/");		
			infos.put("general advanced shareClipboard",  "Bidirectional");		
		
			infos.put("system motherBoard RAM", "128");						
			infos.put("system motherBoard chipset", "PXII");			
			infos.put("system motherBoard pointerSystem", "PS/2 Mouse");	
			infos.put("system motherBoard activateIOAPIC", "true");
			infos.put("system motherBoard internalClockUTC", "true");
			
			infos.put("system processor nbCPU", "2");					
			infos.put("system processor allocatedRessources", "100");
			
			infos.put("display generalDisplay VRAM", "128");					
			infos.put("display generalDisplay monitorCount", "1");	
			infos.put("display generalDisplay 3DAcceleration", "true");
			infos.put("display generalDisplay 2DAcceleration", "true");
			
			HashMap<String, Object> storage = new HashMap<>();
			storage.put("IDE", "IDE controller");
			storage.put("SATA", "SATA controller");
			infos.put("storage", storage);	
            
			
			
			this.hashmap.setName("name"); 
			this.hashmap.setOs("linux"); 
			this.hashmap.setSnapshotFolder("/home/etudiant/"); 
			this.hashmap.setShareClipboard("Bidirectional"); 
			this.hashmap.setShareDragDrop("Bidirectional"); 
			this.hashmap.setRam("128"); 
			this.hashmap.setChipsetType("PXII"); 
			this.hashmap.setPointerSystem("PS/2 Mouse"); 
			this.hashmap.setActivateIoAPIC("true"); 
			this.hashmap.setInternalClockUTC("true"); 
			this.hashmap.setNbCPU("2"); 
			this.hashmap.setAllocatedRessouces("100"); 
			this.hashmap.setvRAM("128"); 
			this.hashmap.setMonitorCount("1"); 
			this.hashmap.setAcceleration2d("true"); 
			this.hashmap.setAcceleration3d("true"); 
			
			HashMap<String, Object> storageC = new HashMap<>();
			storageC.put("IDE", "IDE controller");
			storageC.put("SATA", "SATA controller");
			this.hashmap.setStorageController(storageC); 
			
	

			
			Assert.assertEquals("Config Hashmap : ", infos, this.hashmap.generateConfigHashMap());
		
	}
	
	@Test
	public void getNetworkAdapterTest(){
		HashMap<String, Object> network = new HashMap<>();
		HashMap<String, Object> adapt = new HashMap<>();
		adapt.put("enabled", "true");
		adapt.put("adapterType", "Am79C970A");
		adapt.put("attachmentType", "nat");
		network.put("adaptater1", adapt);

		this.hashmap.setNetwork(network); 
	
		Assert.assertEquals("Network adaptater: ", "PCnet-PCI II (nat) ",this.hashmap.getNetworkAdapter().get(0));
		
		adapt.clear();
		network.clear();
		
		adapt.put("enabled", "true");
		adapt.put("adapterType", "Am79C973");
		adapt.put("attachmentType", "nat");
		network.put("adaptater1", adapt);

		this.hashmap.setNetwork(network); 
	
		Assert.assertEquals("Network adaptater: ", "PCnet-Fast III (nat) ",this.hashmap.getNetworkAdapter().get(0));
		
		adapt.clear();
		network.clear();
		
		adapt.put("enabled", "true");
		adapt.put("adapterType", "I82540EM");
		adapt.put("attachmentType", "nat");
		network.put("adaptater1", adapt);

		this.hashmap.setNetwork(network); 
	
		Assert.assertEquals("Network adaptater: ", "Intel PRO/1000 MT Desktop (nat) ",this.hashmap.getNetworkAdapter().get(0));
		
		adapt.clear();
		network.clear();
		
		adapt.put("enabled", "true");
		adapt.put("adapterType", "I82543GC");
		adapt.put("attachmentType", "nat");
		network.put("adaptater1", adapt);

		this.hashmap.setNetwork(network); 
	
		Assert.assertEquals("Network adaptater: ", "Intel PRO/1000 T Server (nat) ",this.hashmap.getNetworkAdapter().get(0));
		
		adapt.clear();
		network.clear();
		
		adapt.put("enabled", "true");
		adapt.put("adapterType", "I82545EM");
		adapt.put("attachmentType", "nat");
		network.put("adaptater1", adapt);

		this.hashmap.setNetwork(network); 
	
		Assert.assertEquals("Network adaptater: ", "Intel PRO/1000 MT Server (nat) ",this.hashmap.getNetworkAdapter().get(0));
		
		adapt.clear();
		network.clear();
		
		adapt.put("enabled", "true");
		adapt.put("adapterType", "virtio-net");
		adapt.put("attachmentType", "nat");
		network.put("adaptater1", adapt);

		this.hashmap.setNetwork(network); 
	
		Assert.assertEquals("Network adaptater: ", "Paravirtualized Network (nat) ",this.hashmap.getNetworkAdapter().get(0));
	}
	
	@Test
	public void getBootOrderToStringTest(){
		HashMap<String, Object> bootorder = new HashMap<>();
	
		bootorder.put("1", "Floppy");
		bootorder.put("2", "DVD");
 
		this.hashmap.setBootOrder(bootorder); 
		Assert.assertEquals("boot order: ", "Floppy",this.hashmap.getBootOrderToString().get(0));
		Assert.assertEquals("boot order: ", "DVD",this.hashmap.getBootOrderToString().get(1));
	}
	
	@Test
	public void getControllerListTest(){
		HashMap<String, Object> storageC = new HashMap<>();
		HashMap<String, Object> ctrl = new HashMap<>();
		ctrl.put("typeBusController", "IDE");
		ctrl.put("nameController", "IDE0");
		storageC.put("IDE", ctrl);
		HashMap<String, Object> ctrl1 = new HashMap<>();
		ctrl1.put("typeBusController", "SATA");
		ctrl1.put("nameController", "SATA0");
		storageC.put("SATA", ctrl1);
		this.hashmap.setStorageController(storageC); 
		Assert.assertEquals("boot order: ", "IDE0",this.hashmap.getControllerList().get("IDE"));
		Assert.assertEquals("boot order: ", "SATA0",this.hashmap.getControllerList().get("SATA"));	
	}
	
	@Test
	public void getStorageTreeTest(){
		HashMap<String, Object> storageC = new HashMap<>();
			HashMap<String, Object> ctrl = new HashMap<>();
			ctrl.put("nameController", "IDE0");
				HashMap<String, Object> attach = new HashMap<>();
				attach.put("nameDrive", "ubuntu.iso");
			ctrl.put("attachementToPort1", attach);
		storageC.put("IDE", ctrl);

		this.hashmap.setStorageController(storageC); 
		Assert.assertEquals("boot order: ", "[{\"text\":\"Controller : IDE0\",\"nodes\":[{\"text\":\"ubuntu.iso\"}]}]",this.hashmap.getStorageTree());
 	}
	
	@Test
	public void getStorageToStringTest(){
		HashMap<String, Object> storageC = new HashMap<>();
			HashMap<String, Object> ctrl = new HashMap<>();
			ctrl.put("nameController", "IDE0");
				HashMap<String, Object> attach = new HashMap<>();
				attach.put("nameDrive", "ubuntu.iso");
				attach.put("formatDrive", "RAW");
				attach.put("pathDrive", "/home/");
				attach.put("deviceTypeDrive", "DVD");
				attach.put("connectedToPort", "1");
				attach.put("logicalSizeDrive", "150");
			ctrl.put("attachementToPort1", attach);
		storageC.put("IDE", ctrl);

		this.hashmap.setStorageController(storageC); 
		 
		Assert.assertEquals("boot order: ", "[IDE0, 1, RAW, DVD, /home/, ubuntu.iso, 150 B, null]",Arrays.toString(this.hashmap.getStorageToString().get(0)));
 	}



//	generateHashMap & constructor 
	@Test
	public void constructorAndGetHashmapTest(){
		// GENERAL
				HashMap<String, Object> infos = new HashMap<>();
				HashMap<String, Object> general = new HashMap<>();
				HashMap<String, Object> basic = new HashMap<>();
				basic.put("name", "test");
				basic.put("OS", "Linux");
				general.put("basic", basic);
				HashMap<String, Object> advanced = new HashMap<>();
				advanced.put("snapshotFolder", "/home/SnapFolder");
				advanced.put("shareClipboard", "true");
				advanced.put("shareDragDrop", "true");
				general.put("advanced", advanced);
				infos.put("general", general);
				HashMap<String, Object> system = new HashMap<>();
				HashMap<String, Object> motherBoard = new HashMap<>();
				motherBoard.put("RAM", "128");
				HashMap<String, Object> boot = new HashMap<>();
				boot.put("1", "Floppy");
				boot.put("2", "DVD"); 
				motherBoard.put("BootOrder", boot);
				motherBoard.put("chipset", "PIIX3");
				motherBoard.put("pointerSystem", "USBTablet");
				motherBoard.put("activateIOAPIC", "true");
				motherBoard.put("internalClockUTC", "true");
				system.put("motherBoard", motherBoard);
				HashMap<String, Object> processor = new HashMap<>();
				processor.put("nbCPU", "1");
				processor.put("allocatedRessources","100");
				system.put("processor", processor);
				
				infos.put("system", system);
				HashMap<String, Object> display = new HashMap<>();
				HashMap<String, Object> generalDisplay = new HashMap<>();
				generalDisplay.put("VRAM", "128");
				generalDisplay.put("monitorCount","1");
				generalDisplay.put("3DAcceleration", "true");
				generalDisplay.put("2DAcceleration", "true");
				display.put("generalDisplay", generalDisplay);
				
				infos.put("display", display);
				HashMap<String, Object> storageC = new HashMap<>();
				HashMap<String, Object> ctrl = new HashMap<>();
				ctrl.put("nameController", "IDE0");
					HashMap<String, Object> attach = new HashMap<>();
					attach.put("nameDrive", "ubuntu.iso");
					attach.put("formatDrive", "RAW");
					attach.put("pathDrive", "/home/");
					attach.put("deviceTypeDrive", "DVD");
					attach.put("connectedToPort", "1");
					attach.put("logicalSizeDrive", "150");
				ctrl.put("attachementToPort1", attach);
				storageC.put("IDE", ctrl);
				infos.put("storage", storageC);
				
				HashMap<String, Object> network = new HashMap<>();
				HashMap<String, Object> adapt = new HashMap<>();
				adapt.put("enabled", "true");
				adapt.put("adapterType", "Am79C970A");
				adapt.put("attachmentType", "nat");
				network.put("adaptater1", adapt);

				this.hashmap.setNetwork(network); 
				infos.put("network", network);
		
				HashMap<String, Object> shareF = new HashMap<>();
				
				infos.put("sharedFolders",shareF );
				
				
				HashmapBO hashmap = new HashmapBO(infos);
				
				Assert.assertEquals("constructor & getHashmap", infos.toString(),hashmap.generateHashMap().toString());

			


		
		
	}
	
	
	
	
	
	
	


}
