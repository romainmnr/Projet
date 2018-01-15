package rwb.servlet.machine;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.Mockito;

public class ConfigureMachineTest {

	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		ConfigureMachine configureMachine = new ConfigureMachine();
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);

		String NETWORKADAPTER = "cfg-network-adapter0";

		Mockito.when(request.getParameter("cfg-machine-srvid")).thenReturn("2");
		Mockito.when(request.getParameter("cfg-machine-vmid")).thenReturn("ServletModifMachineTest");
		Mockito.when(request.getParameter("cfg-general-basic-name")).thenReturn("ServletModifMachineTest");
		Mockito.when(request.getParameter("cfg-general-basic-os")).thenReturn("Debian_64");
		Mockito.when(request.getParameter("cfg-general-advanced-snapshotFld")).thenReturn("snapshotFolder");
		Mockito.when(request.getParameter("cfg-general-advanced-clipboard")).thenReturn("Bidirectional");
		Mockito.when(request.getParameter("cfg-general-advanced-dragndrop")).thenReturn("Bidirectional");
		Mockito.when(request.getParameter("cfg-system-motherboard-ram")).thenReturn("1024");
		Mockito.when(request.getParameter("cfg-system-motherboard-chipset")).thenReturn("ICH9");
		Mockito.when(request.getParameter("cfg-system-motherboard-pointerSystem")).thenReturn("USBMouse");
		Mockito.when(request.getParameter("cfg-system-motherboard-activateioapic")).thenReturn("true");
		Mockito.when(request.getParameter("cfg-system-motherboard-internalclockutc")).thenReturn("true");
		Mockito.when(request.getParameter("cfg-system-processor-nbcpu")).thenReturn("4");
		Mockito.when(request.getParameter("cfg-system-processor-allocatedressources")).thenReturn("1024");
		Mockito.when(request.getParameter("cfg-display-generalDisplay-vram")).thenReturn("2048");
		Mockito.when(request.getParameter("cfg-display-generalDisplay-monitorCount")).thenReturn("2");
		Mockito.when(request.getParameter("cfg-display-generalDisplay-3DAcceleration")).thenReturn("true");
		Mockito.when(request.getParameter("cfg-display-generalDisplay-2DAcceleration")).thenReturn("true");
		Mockito.when(request.getParameter(NETWORKADAPTER + "-enable")).thenReturn("true");
		Mockito.when(request.getParameter(NETWORKADAPTER + "-cableConnected")).thenReturn("true");
		Mockito.when(request.getParameter(NETWORKADAPTER + "-adapterType")).thenReturn("Am79C970A");
		Mockito.when(request.getParameter(NETWORKADAPTER + "-promiscousMode")).thenReturn("AllowAll");
		Mockito.when(request.getParameter(NETWORKADAPTER + "-selectModeNetwork")).thenReturn("NATNetwork");
		Mockito.when(request.getParameter(NETWORKADAPTER + "-nameNetwork")).thenReturn("network");

		PrintWriter writer = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writer);

		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		Object[] args = { request, response };
		Method method = configureMachine.getClass().getDeclaredMethod("service", argsTypes);
		method.invoke(configureMachine, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
	}
}
