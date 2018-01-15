package rwb.servlet.machine;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.Test;
import org.mockito.Mockito;

public class CreateDeleteMachineTest {

	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		CreateMachine createMachine = new CreateMachine();
		DeleteMachine deleteMachine = new DeleteMachine();
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);
		HttpSession session = Mockito.mock(HttpSession.class);
		
		Mockito.when(request.getParameter("vm-server")).thenReturn("2");
		Mockito.when(request.getParameter("vm-name")).thenReturn("CreateDeleteTest");
		Mockito.when(request.getParameter("vm-os")).thenReturn("Debian_64");
		Mockito.when(request.getParameter("vm-ram")).thenReturn("2048");
		Mockito.when(request.getParameter("vm-cpu")).thenReturn("1");
		Mockito.when(request.getSession()).thenReturn(session);
		Mockito.when(session.getAttribute("login-id")).thenReturn("1");
		Mockito.when(request.getParameter("delete-srv")).thenReturn("2");
		Mockito.when(request.getParameter("delete-vm")).thenReturn("CreateDeleteTest");
		Mockito.when(request.getParameter("delete-vm-mode")).thenReturn("M-HDD-ISO");

		PrintWriter writerCreate = new PrintWriter("somefile.txt");
        Mockito.when(response.getWriter()).thenReturn(writerCreate);
        
		Class[] argsTypes = {HttpServletRequest.class, HttpServletResponse.class};
		Object[] args = {request, response};	
		Method methodCreate = createMachine.getClass().getDeclaredMethod("service", argsTypes);
		methodCreate.invoke(createMachine, args);
		
		writerCreate.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("Machine created"));
		
		PrintWriter writerDelete = new PrintWriter("somefile.txt");
        Mockito.when(response.getWriter()).thenReturn(writerDelete);
        
		Method methodDelete = deleteMachine.getClass().getDeclaredMethod("service", argsTypes);
		methodDelete.invoke(deleteMachine, args);
		
		writerDelete.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("Machine deleted"));
	}
}
