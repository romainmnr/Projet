package rwb.java.vb.bo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.virtualbox_5_0.IMachine;
import org.virtualbox_5_0.ISnapshot;

import rwb.java.vb.dao.VirtualBoxDAO;

public class SnapshotBOTest {

	private VirtualBoxBO vbox;
	
	@Before
	public void setUp(){
		this.vbox = new VirtualBoxBO(new VirtualBoxDAO("192.168.4.201",18083,"etudiant","network"),true);
	}
	
	@After
	public void tearDown(){
		vbox.powerDownForcedMachine("ArthurSnap2");
	}

	
	@Test
	public void scenario1() {
				
		vbox.takeSnap("SnapshotTest", "snapTest");
		vbox.restoreFromSnapName("SnapshotTest", "snapTest");
		Assert.assertEquals("snapTest", 
				vbox.getMachineBO("SnapshotTest").getSnapshotBO().getCurrentSnapName());
		
		vbox.takeSnap("SnapshotTest", "snapTest2");
		vbox.takeSnap("SnapshotTest", "snapTest3");
		vbox.takeSnap("SnapshotTest", "snapTest4");
		
		vbox.restoreFromSnapId("SnapshotTest", 
				vbox.getMachine("SnapshotTest").getSnapshotBO().findSnapByName("snapTest2").getId());
		Assert.assertEquals("snapTest2", 
				vbox.getMachineBO("SnapshotTest").getSnapshotBO().getCurrentSnapName());
		
		vbox.restoreFromSnapName("SnapshotTest", "snapTest");
		Assert.assertEquals("snapTest", 
				vbox.getMachineBO("SnapshotTest").getSnapshotBO().getCurrentSnapName());
		
		vbox.deleteSnapById("SnapshotTest", 
				vbox.getMachine("SnapshotTest").getSnapshotBO().findSnapByName("snapTest4").getId());
		vbox.deleteSnapById("SnapshotTest", 
				vbox.getMachine("SnapshotTest").getSnapshotBO().findSnapByName("snapTest3").getId());
		vbox.deleteSnapById("SnapshotTest", 
				vbox.getMachine("SnapshotTest").getSnapshotBO().findSnapByName("snapTest2").getId());
		vbox.deleteCurrentSnap("SnapshotTest");	
	}

	@Test
	public void scenario2() {
	
		
		vbox.getMachineBO("ArthurSnap2").powerUp();

		vbox.takeSnap("ArthurSnap2", "snapTest");
		
		vbox.getMachineBO("ArthurSnap2").powerDownForced();
		
		vbox.restoreFromSnapName("ArthurSnap2", "snapTest");
		Assert.assertEquals("snapTest", 
				vbox.getMachineBO("ArthurSnap2").getSnapshotBO().getCurrentSnapName());
		vbox.deleteCurrentSnap("ArthurSnap2");
	}
	
	@Test
	public void scenario3() {
		vbox.getMachineBO("ArthurSnap2").powerUp();
		vbox.getMachineBO("ArthurSnap2").pause();

		vbox.takeSnap("ArthurSnap2", "snapTest");
		vbox.getMachineBO("ArthurSnap2").powerDownForced();
		
		vbox.restoreFromSnapName("ArthurSnap2", "snapTest");
		Assert.assertEquals("snapTest", 
				vbox.getMachineBO("ArthurSnap2").getSnapshotBO().getCurrentSnapName());
		vbox.deleteCurrentSnap("ArthurSnap2");
		
	}
	
	
	@Test
	public void SnapshotTest() {
		SnapshotBO snapshotBO = new SnapshotBO();
		
		IMachine machineMock = Mockito.mock(IMachine.class);
		ISnapshot currentSnapshotMock = Mockito.mock(ISnapshot.class);
		ISnapshot snapshotFindMock = Mockito.mock(ISnapshot.class);
		ISnapshot snapChildren1Mock = Mockito.mock(ISnapshot.class);
		ISnapshot snapChildren2Mock = Mockito.mock(ISnapshot.class);

		List<ISnapshot> listSnapChildren = new ArrayList<>();
		listSnapChildren.add(snapChildren1Mock);
		listSnapChildren.add(snapChildren2Mock);

		Mockito.when(snapChildren1Mock.getId()).thenReturn("456");
		Mockito.when(snapChildren1Mock.getName()).thenReturn("snapChildren1");

		Mockito.when(snapChildren2Mock.getId()).thenReturn("789");
		Mockito.when(snapChildren2Mock.getName()).thenReturn("snapChildren2");

		Mockito.when(currentSnapshotMock.getId()).thenReturn("123");
		Mockito.when(currentSnapshotMock.getName()).thenReturn("snapshotCurrent");
		Mockito.when(currentSnapshotMock.getChildren()).thenReturn(listSnapChildren);

		Mockito.when(machineMock.getCurrentSnapshot()).thenReturn(currentSnapshotMock);
		Mockito.when(machineMock.findSnapshot("123")).thenReturn(snapshotFindMock);
		Mockito.when(machineMock.findSnapshot("snapshotSaved")).thenReturn(snapshotFindMock);

		Mockito.when(machineMock.findSnapshot(null)).thenReturn(currentSnapshotMock);
		
		String[] snapsName = { "snapshotCurrent", "snapChildren1", "snapChildren2" };
		List<String> treeSnapName = Arrays.asList(snapsName);

		snapshotBO.getTreeSnapshotsName();
		snapshotBO.setMachine(machineMock);

		
		Assert.assertEquals("123", snapshotBO.getCurrentSnapId());
		Assert.assertEquals("snapshotCurrent", snapshotBO.getCurrentSnapName());
		Assert.assertEquals(snapshotFindMock, snapshotBO.findSnapById("123"));
		Assert.assertEquals(snapshotFindMock, snapshotBO.findSnapByName("snapshotSaved"));
		Assert.assertEquals(listSnapChildren, snapshotBO.findSnapChildren());

	}


	@Test
	public void scenarioCatch() {

		Assert.assertEquals("Snapshot not found", vbox.findSnapUuid("ArthurSnap2", "yolo"));
		Assert.assertEquals("Snapshot not found",vbox.findSnapName("ArthurSnap2", "yolo"));
	
		Assert.assertEquals("null", 
				vbox.getMachineBO("SnapshotTest").getSnapshotBO().getCurrentSnapName());
	
		Assert.assertEquals("null", 
				vbox.getMachineBO("SnapshotTest").getSnapshotBO().getCurrentSnapId());
		
	}
	
	
	@After
	public void disco () {
		vbox.disconnect();

	}
	

}
