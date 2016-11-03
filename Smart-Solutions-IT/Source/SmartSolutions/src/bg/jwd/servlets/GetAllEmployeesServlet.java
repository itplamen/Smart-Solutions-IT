package bg.jwd.servlets;

import java.io.IOException;
import java.security.InvalidParameterException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bg.jwd.contracts.IConstants;
import bg.jwd.data.Database;
import bg.jwd.models.Employee;

public class GetAllEmployeesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest httpRequest, HttpServletResponse httpResponse) 
			throws ServletException, IOException {
		
		String sortBy = httpRequest.getParameter(IConstants.SORT_BY_PARAMETER);
		
		if (sortBy != null && !sortBy.isEmpty()) {
			List<Employee> sortedEmployees = null;
			
			try {
				if (sortBy.equals(IConstants.LAST_NAME_PARAMETER)) {
					sortedEmployees = Database.sortEmployeesByLastName();
				}
				else if (sortBy.equals(IConstants.DATE_OF_BIRTH_PARAMETER)) {
					sortedEmployees = Database.sortEmployeesByDateOfBirth();
				}
				else {
					throw new InvalidParameterException("Employees can be sorted only by Last Name and Date of Birth!");
				}
				
				httpRequest.getSession().setAttribute(IConstants.ALL_EMPLOYEES_PARAMETER, sortedEmployees);
				
				RequestDispatcher dispatcher = httpRequest
						.getRequestDispatcher(IConstants.SHOW_ALL_EMPLOYEES_PAGE + "?sortBy=" + sortBy);
				
				dispatcher.forward(httpRequest, httpResponse);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		else {
			List<Employee> allEmployees = null;
			
			try {
				allEmployees = Database.getAllEmployees();
				
				httpRequest.getSession().setAttribute(IConstants.ALL_EMPLOYEES_PARAMETER, allEmployees);
				
				RequestDispatcher dispatcher = httpRequest
						.getRequestDispatcher(IConstants.SHOW_ALL_EMPLOYEES_PAGE);
				
				dispatcher.forward(httpRequest, httpResponse);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
