package bg.jwd.data;

import javax.servlet.http.HttpServletRequest;

import bg.jwd.contracts.IConstants;
import bg.jwd.models.Department;
import bg.jwd.models.Employee;
import bg.jwd.models.Gender;

public class EmployeeUtils {
	
	public static Employee createNewEmployeeModel(HttpServletRequest httpRequest) {
		
		String firstName = httpRequest.getParameter(IConstants.FIRST_NAME_PARAMETER);
		String lastName = httpRequest.getParameter(IConstants.LAST_NAME_PARAMETER);
		String jobPosition = httpRequest.getParameter(IConstants.JOB_POSITION_PARAMETER);
		String selectedDepartment = httpRequest.getParameter(IConstants.DEPARTMENT_PARAMETER);
		String selectedGender = httpRequest.getParameter(IConstants.GENDER_PARAMETER);
		String dateOfBirth = httpRequest.getParameter(IConstants.DATE_OF_BIRTH_PARAMETER);
		String phoneNumber = httpRequest.getParameter(IConstants.PHONE_NUMBER_PARAMETER);
		String emailAddress = httpRequest.getParameter(IConstants.EMAIL_ADDRESS_PARAMETER);
		
		Department department = Department.valueOf(selectedDepartment);
		Gender gender = Gender.valueOf(selectedGender);

		return new Employee(firstName, lastName, jobPosition, department, gender, 
							dateOfBirth, phoneNumber, emailAddress); 
	}
}