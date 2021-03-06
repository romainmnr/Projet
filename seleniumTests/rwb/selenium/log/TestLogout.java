package rwb.selenium.log;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.io.File;
import java.util.concurrent.TimeUnit;

import org.junit.*;
import org.junit.runners.MethodSorters;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

import rwb.selenium.Messages;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestLogout {
	
	private static WebDriver driver;

	private static final String SYSTEM_PROPERTY = Messages.getString("chrome_driver"); //$NON-NLS-1$

	private static final String DRIVER_LOCATION = Messages.getString("chrome_path"); //$NON-NLS-1$
	
	
	@BeforeClass
	public static void setup() {
		File driverLocation = new File(DRIVER_LOCATION);
		if (!driverLocation.exists()) {
			fail(Messages.getString("no_executable"));
		}
		System.setProperty(SYSTEM_PROPERTY, DRIVER_LOCATION);
		driver = new ChromeDriver();
		driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
		driver.manage().window().setSize(new Dimension(1024, 768));
	}
	
	@AfterClass
	public static void cleanup() {
		driver.quit();
	}
	
  /**
   * Test to deconnect to Remote Web Box
   * Check if the title and url are correct 
   */
	@Test
	public void scenario3_logOut() {
		driver.findElement(By.id("logout-btn")).click();
		assertEquals(Messages.getString("rwb_login_title"), driver.getTitle());
		assertEquals(Messages.getString("rwb_login_url"), driver.getCurrentUrl());
	}
}
