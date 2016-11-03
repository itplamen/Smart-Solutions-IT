package bg.jwd.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bg.jwd.contracts.IConstants;
import bg.jwd.data.Database;
import bg.jwd.data.EmployeeUtils;
import bg.jwd.models.Employee;

public class AddEmployeeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest httpRequest, HttpServletResponse httpResponse) 
			throws ServletException, IOException {
		
		try {
			Employee newEmployee = EmployeeUtils.createNewEmployeeModel(httpRequest);
			Database.addEmployee(newEmployee);
			
			httpRequest.getSession().setAttribute(IConstants.PHONE_NUMBER_PARAMETER, newEmployee.getPhoneNumber());
			httpRequest.getSession().setAttribute(IConstants.EMAIL_ADDRESS_PARAMETER, newEmployee.getEmailAddress());

			httpResponse.sendRedirect(httpRequest.getContextPath() + IConstants.ADD_EMPLOYEE_PAGE);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
