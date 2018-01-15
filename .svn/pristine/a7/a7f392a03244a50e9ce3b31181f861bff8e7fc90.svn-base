package rwb.selenium.menuBar;

import static org.junit.Assert.*;

import java.io.File;
import java.util.concurrent.TimeUnit;

import org.junit.*;
import org.junit.runners.MethodSorters;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

import rwb.selenium.Messages;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestNewMachine {

	private static WebDriver driver;

	private static final String SYSTEM_PROPERTY = Messages.getString("chrome_driver"); //$NON-NLS-1$

	private static final String DRIVER_LOCATION = Messages.getString("chrome_path"); //$NON-NLS-1$

	private static String newVm = "testSelenium4";

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
	
  /**
   * Test button create a new VM 
   * Check if the title of modal and url are correct
   */
	@Test
	public void scenario3_clickOnNewMachine() {
			
		driver.findElement(By.id("newMachine-btn")).click();
		String title = driver.findElement(By.id("newMachine-modal-title")).getText();
		assertEquals(Messages.getString("rwb_newMachine_modal_title"), title);
	}
	
	/**
	 * Test to create a new VM 
	 * Check redirection
	 */
	@Test
	public void scenario4_completeForm() {
		
		//input name
		driver.findElement(By.name("vm-name")).sendKeys(newVm);
		driver.findElement(By.id("modal-next-btn")).click();
		driver.findElement(By.id("modal-next-btn")).click();
		driver.findElement(By.id("btn-create-machine")).click();
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		//check redirection
		//assertEquals(Messages.getString("rwb_index_title"), driver.getTitle());
		//assertEquals(Messages.getString("rwb_index_url"), driver.getCurrentUrl());

	}
	
	/**
	 * Check informations of the new VM 
	 */
	/*@Test
	public void scenario5_checkMachine() {
		
		driver.findElement(By.id("menu-btn")).click();
		try {
			Thread.sleep(25000);
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		WebElement vm = driver.findElement(By.id("newVm)"));
		vm.click();
		try {
			Thread.sleep(9000);
		} catch (InterruptedException e) {
		
			e.printStackTrace();
		}
		assertEquals(Messages.getString("rwb_selectMachine2"), driver.getTitle());
		assertEquals(Messages.getString("rwb_selectMachine2_url"), driver.getCurrentUrl());
	}*/
}
