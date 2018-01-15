package rwb.java.vb.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.Mockito;
import org.testng.Assert;
import org.virtualbox_5_0.IMachine;
import org.virtualbox_5_0.ISession;
import org.virtualbox_5_0.IVirtualBox;
import org.virtualbox_5_0.SessionState;
import org.virtualbox_5_0.VirtualBoxManager;

import rwb.java.divers.HashmapBO;
import rwb.java.vb.dao.VirtualBoxDAO;

public class VirtualBoxBOTest {

	private VirtualBoxBO vbox;
	private VirtualBoxBO vboxEmpty;
	@SuppressWarnings("unused")
	private VirtualBoxDAO dao;
	private MachineBO machineBOMock;

	@Before
	public void setUp() {
		// this.dao = new VirtualBoxDAO("192.168.4.201", 18083, "etudiant",
		// "network");
		// this.vbox = new VirtualBoxBO(dao);
		this.vboxEmpty = new VirtualBoxBO();

		machineBOMock = Mockito.mock(MachineBO.class);

		Mockito.when(machineBOMock.getName()).thenReturn("name");
		List<MachineBO> listeMachineBO = new ArrayList<MachineBO>();
		listeMachineBO.add(machineBOMock);
		this.vboxEmpty.setListMachineBO(listeMachineBO);
	}

	@After
	public void tearDown() {

	}

	@Test
	public void accesseurAttributsTest() {
		List<MachineBO> listMachineBO = new ArrayList<MachineBO>();
		MachineBO machineBO = Mockito.mock(MachineBO.class);
		listMachineBO.add(machineBO);
		VirtualBoxManager vbm = Mockito.mock(VirtualBoxManager.class);
		IVirtualBox vbox = Mockito.mock(IVirtualBox.class);
		VirtualBoxDAO dao = Mockito.mock(VirtualBoxDAO.class);
		HashMap<String, Object> hostInfos = new HashMap<String, Object>();

		vboxEmpty.setHostInfos(hostInfos);
		vboxEmpty.setVbm(vbm);
		vboxEmpty.setVbox(vbox);
		vboxEmpty.setListMachineBO(listMachineBO);
		vboxEmpty.setDao(dao);

		Assert.assertEquals(dao, vboxEmpty.getDao());
		Assert.assertEquals(vbm, vboxEmpty.getVbm());
		Assert.assertEquals(vbox, vboxEmpty.getVbox());
		Assert.assertEquals(listMachineBO, vboxEmpty.getListMachineBO());
		Assert.assertEquals(hostInfos, vboxEmpty.getHostInfos());

	}

	
	@Test
	public void createMachineTest() {
		VirtualBoxManager vbm = Mockito.mock(VirtualBoxManager.class);
		IVirtualBox vboxMock = Mockito.mock(IVirtualBox.class);
		ISession sessionMock = Mockito.mock(ISession.class);
		IMachine machineSessionMock = Mockito.mock(IMachine.class);
		IMachine machineVBoxMock = Mockito.mock(IMachine.class);

		Mockito.when(vboxMock.createMachine(null, "createMachineTest", null, "Linux_64", null))
				.thenReturn(machineVBoxMock);
		Mockito.when(sessionMock.getMachine()).thenReturn(machineSessionMock);
		Mockito.when(vbm.getVBox()).thenReturn(vboxMock);
		Mockito.when(vbm.getSessionObject()).thenReturn(sessionMock);
		vboxEmpty.setVbm(vbm);

		HashmapBO settings = new HashmapBO();
		settings.setName("createMachineTest");
		settings.setOs("Linux_64");

		vboxEmpty.createMachine((HashMap<String, Object>) settings.generateConfigHashMap(), "createMachineTest");

		Assert.assertTrue(vbox.getMachineBO("createMachineTest") != null);
	}

	@Test
	public void powerChangeMachineTest() {

		//Assert.assertFalse((boolean) this.vboxEmpty.powerUpMachine("name").get(0));
		Assert.assertFalse((boolean) this.vboxEmpty.powerDownMachine("name").get(0));
		//Assert.assertFalse((boolean) this.vboxEmpty.powerUpMachine("name").get(0));
		Assert.assertFalse((boolean) this.vboxEmpty.powerDownForcedMachine("name").get(0));
	}

	@Test
	public void modifMachineTest() {
		Assert.assertTrue(this.vboxEmpty.modifMachine(null, "name"));
	}

	@Test
	public void deleteMachineTest() {
		Assert.assertTrue(this.vboxEmpty.getMachineBO("name") != null);

		this.vboxEmpty.deleteMachine("name", null);

		Assert.assertTrue(this.vboxEmpty.getMachineBO("name") == null);

		List<MachineBO> listeMachineBO = new ArrayList<MachineBO>();
		listeMachineBO.add(machineBOMock);
		this.vboxEmpty.setListMachineBO(listeMachineBO);
	}

	@Test
	public void getInfosMachineTest() {
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("name", "name");

		Mockito.when(machineBOMock.getInfos()).thenReturn(infos);

		Assert.assertEquals("name", vboxEmpty.getInfosMachine("name").get("name"));
	}

	@Test
	public void getMachineBOTest() {
		Assert.assertEquals("name", vboxEmpty.getMachineBO("name").getName());
	}

	@Test
	public void getAllMachineBOTest() {
		MachineBO machineBOMock = Mockito.mock(MachineBO.class);

		Mockito.when(machineBOMock.getName()).thenReturn("name");
		List<MachineBO> listeMachineBO = new ArrayList<MachineBO>();
		listeMachineBO.add(machineBOMock);
		this.vboxEmpty.setListMachineBO(listeMachineBO);

		Assert.assertEquals(listeMachineBO, vboxEmpty.getListMachineBO());
	}

	@Test
	public void getSessionState() {
		Mockito.when(machineBOMock.getSessionState()).thenReturn(SessionState.Locked);
		Assert.assertEquals(SessionState.Locked, vboxEmpty.getSessionStateMachine("name"));
	}

	@Test
	public void getPreviewMachineTest() {
		Mockito.when(machineBOMock.getState()).thenReturn("Running");
	}

	@Test
	public void getListMachineBOTest() {

		MachineBO machineBOMock = Mockito.mock(MachineBO.class);
		List<MachineBO> liste = new ArrayList<MachineBO>();
		liste.add(machineBOMock);
		this.vboxEmpty.setListMachineBO(liste);
		Assert.assertEquals(liste, this.vboxEmpty.getListMachineBO());
	}
}
