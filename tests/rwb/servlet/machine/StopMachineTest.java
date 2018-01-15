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
import org.junit.Test;
import org.mockito.Mockito;

public class StopMachineTest {

	@Test
	public void stopMachine() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		StopMachine stopMachine = new StopMachine();
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);

		Mockito.when(request.getParameter("stop-srv")).thenReturn("2");
		Mockito.when(request.getParameter("stop-vm")).thenReturn("ServletTest");
		Mockito.when(request.getParameter("stopMode-vm")).thenReturn("forced");

		PrintWriter writer = new PrintWriter("somefile.txt");
        Mockito.when(response.getWriter()).thenReturn(writer);
        
		Class[] argsTypes = {HttpServletRequest.class, HttpServletResponse.class};
		Object[] args = {request, response};
		Method method = stopMachine.getClass().getDeclaredMethod("service", argsTypes);
		method.invoke(stopMachine, args);
		
        
		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("Machine off"));
	}
}
