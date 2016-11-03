package bg.jwd.models;

public class Employee {
	
	private int id;
	private String firstName;
	private String lastName;
	private String jobPosition;
	private Department department; 		
	private Gender gender;			
	private String dateOfBirth;
	private String phoneNumber;
	private String emailAddress;
	
	public Employee(String firstName, String lastName, String jobPosition, Department department,
			Gender gender, String dateOfBirth, String phoneNumber, String emailAddress) {
	
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setJobPosition(jobPosition);
		this.setDepartment(department);
		this.setGender(gender);
		this.setDateOfBirth(dateOfBirth);
		this.setPhoneNumber(phoneNumber);
		this.setEmailAddress(emailAddress);
	}
	
	public int getID() {
		return this.id;
	}
	
	public void setID(int id) {
		if (id <= 0) {
			throw new IndexOutOfBoundsException("ID cannot be zero or negative!");
		}
		
		this.id = id;
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public void setFirstName(String firstName) {
		if (firstName == null || firstName.isEmpty()) {
			throw new NullPointerException("First name cannot be null or empty!");
		}
		
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return this.lastName;
	}
	
	public void setLastName(String lastName) {
		if (lastName == null || lastName.isEmpty()) {
			throw new NullPointerException("Last name cannot be null or empty!");
		}
		
		this.lastName = lastName;
	}
	
	public String getJobPosition() {
		return this.jobPosition;
	}
	
	// Can be null in the database table.
	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}
	
	public Department getDepartment() {
		return this.department;
	}
	
	public void setDepartment(Department department) {
		if (department == null) {
			throw new NullPointerException("Department cannot be null!");
		}
		
		this.department = department;
	}
	
	public Gender getGender() {
		return this.gender;
	}
	
	public void setGender(Gender gender) {
		if (gender == null) {
			throw new NullPointerException("Gender cannot be null!");
		}
		
		this.gender = gender;
	}
	
	public String getDateOfBirth() {
		return this.dateOfBirth;
	}
	
	public void setDateOfBirth(String date) {
		if (date == null || date.isEmpty()) {
			throw new NullPointerException("Date of Birth cannot be null or empty!");
		}
		
		this.dateOfBirth = date;
	}
	
	public String getPhoneNumber() {
		return this.phoneNumber;
	}
	
	// Can be null in the database table.
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getEmailAddress() {
		return this.emailAddress;
	}
	
	public void setEmailAddress(String email) {
		if (email == null || email.isEmpty()) {
			throw new NullPointerException("E-mail address cannot be null or empty!");
		}
		
		this.emailAddress = email;
	}
	
	@Override
	public String toString() {
		return this.firstName + " " + this.lastName + " " + this.jobPosition + " " + this.department + 
				" " + this.gender + " " + this.dateOfBirth + " " + this.phoneNumber + " " + this.emailAddress;
	}
}
