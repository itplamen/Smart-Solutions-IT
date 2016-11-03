package bg.jwd.contracts;

import bg.jwd.models.Department;

public interface IConstants {
	public static final String ADMIN_USERNAME = "admin";
	public static final String ADMIN_PASSWORD = "1234";
	
	public static final String EMPTY_URL = "";
	public static final String LOGIN_PAGE = "/Login";
	public static final String HOME_PAGE = "/Home";
	public static final String ADD_EMPLOYEE_PAGE = "/Employees/Add";
	public static final String SHOW_ALL_EMPLOYEES_PAGE = "/ShowAllEmployees";
	public static final String SEARCH_RESULTS_PAGE = "/Search/Results";
	public static final String EMPLOYEE_PROFILE_PAGE = "/EmployeeProfile";
	public static final String UPDATE_EMPLOYEE_PAGE = "/UpdateEmployee";
	
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String ALL_EMPLOYEES_SERVLET = "/Employees/All";
	
	public static final String INVALID_PARAMETER = "invalid";
	public static final String USERNAME_PARAMETER = "username";
	public static final String PASSWORD_PARAMETER = "password";
	public static final String ID_PARAMETER = "id";
	public static final String FIRST_NAME_PARAMETER = "firstName";
	public static final String LAST_NAME_PARAMETER = "lastName";
	public static final String JOB_POSITION_PARAMETER = "jobPosition";
	public static final String DEPARTMENT_PARAMETER = "department";
	public static final String GENDER_PARAMETER = "gender";
	public static final String DATE_OF_BIRTH_PARAMETER = "dateOfBirth";
	public static final String PHONE_NUMBER_PARAMETER = "phoneNumber";
	public static final String EMAIL_ADDRESS_PARAMETER = "emailAddress";
	public static final String EMAIL_ALREADY_EXISTS = "emailAlReadyExists";
	public static final String SEARCH_PARAMETER = "search";
	public static final String MATCHED_PARAMETER = "matched";
	public static final String SELECTED_EMPLOYEE_PARAMETER = "selectedEmployee";
	public static final String SORT_BY_PARAMETER = "sortBy";
	public static final String ALL_EMPLOYEES_PARAMETER = "allEmployees";
	public static final String DELETED_PARAMETER = "deleted";
	public static final String DELETE_ID_PARAMETER = "deleteID";
	
	public static final Department[] DEFAULT_DEPARTMENTS =
	{
		Department.Engineering, Department.Sales, Department.Marketing, 
		Department.Purchasing, Department.Research_And_Development, 
		Department.Production, Department.Human_Resources, Department.Finance, 
		Department.Quality_Assurance
	};
}
