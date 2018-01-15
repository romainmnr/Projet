package rwb.java.divers;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.testng.Assert;
import org.virtualbox_5_0.IGuestOSType;
import org.virtualbox_5_0.IMachine;
import org.virtualbox_5_0.IVirtualBox;

public class InfosTest {

	private Infos infos;
	private IVirtualBox vbox;

	@Before
	public void setUp() {
		this.vbox = Mockito.mock(IVirtualBox.class);
		this.infos = new Infos(vbox);
	}

	@Test
	public void getListOSTest() {
		IGuestOSType guestOSTypeMock = Mockito.mock(IGuestOSType.class);
		List<IGuestOSType> listOS = new ArrayList<IGuestOSType>();
		listOS.add(guestOSTypeMock);
		Mockito.when(vbox.getGuestOSTypes()).thenReturn(listOS);

		Assert.assertEquals(listOS, infos.getListOS());
	}

	@Test
	public void getAllIMachinesTest() {
		IMachine machine = Mockito.mock(IMachine.class);
		List<IMachine> listeMachine = new ArrayList<IMachine>();
		listeMachine.add(machine);
		Mockito.when(vbox.getMachines()).thenReturn(listeMachine);

		Assert.assertEquals(listeMachine, infos.getAllIMachines());
	}

	@Test
	public void getAllAttributsMachineTest() {
		Assert.assertEquals("getAccelerate3DEnabled", infos.getAllAttributsMachine()[0]);
	}
}
