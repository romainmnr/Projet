package rwb.java.divers;

import org.junit.Test;
import org.testng.Assert;

public class ToolsTest {

	
	@Test
	public void getOSTest(){
		Assert.assertEquals("os_win31.png", Tools.getOS().get("windows").get("Windows31"));
		Assert.assertEquals("os_debian_64.png", Tools.getOS().get("Linux").get("Debian_64"));
		Assert.assertEquals("os_macosx_64.png", Tools.getOS().get("Mac OS X").get("MacOS1010_64"));
	}
	
	@Test
	public void getOsTypeTest(){
		Assert.assertEquals("windows", Tools.getOsType("Win146"));
		Assert.assertEquals("Linux", Tools.getOsType("Linux64"));
		Assert.assertEquals("Mac OS X", Tools.getOsType("Mac95"));
		Assert.assertEquals("Other", Tools.getOsType("Inconnu"));
	}
	
	@Test
	public void getOsIconTest(){
		Assert.assertEquals("os_win_other.png", Tools.getOsIcon("Win146"));
		Assert.assertEquals("os_linux_other.png", Tools.getOsIcon("Linux64"));
		Assert.assertEquals("os_macosx.png", Tools.getOsIcon("Mac95"));
		Assert.assertEquals("os_other.png", Tools.getOsIcon("Inconnu"));
	}
	
	@Test 
	public void getRAMValueTest() {
		Assert.assertEquals((long) 32768, Tools.getRAMValue(32768));
		Assert.assertEquals((long) 32768, Tools.getRAMValue(33005));
	}


	@Test
	public void getHDDValueTest() {
		long val = 1073741824;
		Assert.assertEquals(val, Tools.getHDDValue(1));
	}
}
