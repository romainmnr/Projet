package rwb.selenium.sidebar;

import static org.junit.Assert.*;

import java.io.File;
import java.util.concurrent.TimeUnit;

import org.junit.*;
import org.junit.runners.MethodSorters;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

import rwb.selenium.Messages;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestSelectMachine {

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
   * Test to open a page web : localhost:8080/Projet/
   * Check if the title is correct 
   */
	@Test
	public void scenario1_accessToWebSite() {
		driver.get(Messages.getString("rwb_address"));
		assertEquals(Messages.getString("rwb_login_title"), driver.getTitle());
	}
	
  /**
   * Test to open Remote Web Box
   * Check if the title and url are correct 
   */
	@Test
	public void scenario2_logIn() {
		driver.findElement(By.id("login-username")).sendKeys("admin");
		driver.findElement(By.id("login-password")).sendKeys("admin");
		driver.findElement(By.id("log_in_btn")).click();
		assertEquals(Messages.getString("rwb_index_title"), driver.getTitle());
		assertEquals(Messages.getString("rwb_index_url"), driver.getCurrentUrl());
	}
	
  /**
   * Test to select VM
   * Check if the title and url are correct
   */
	@Test
	public void scenario2_selectMachine() {
		driver.findElement(By.id("menu-btn")).click();
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
		
			e.printStackTrace();
		}
		driver.findElement(By.id(Messages.getString("rwb_selectMachine_name"))).click();
		try {
			Thread.sleep(14000);
		} catch (InterruptedException e) {
		
			e.printStackTrace();
		}
		assertEquals(Messages.getString("rwb_selectMachine"), driver.getTitle());
		assertEquals(Messages.getString("rwb_selectMachine_url"), driver.getCurrentUrl());	
	}
}

