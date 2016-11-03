<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag import="bg.jwd.contracts.IConstants"%>
<%@tag import="bg.jwd.models.Gender"%>

<%@ attribute name="sectionTitle" %>

<c:set var="selectedEmployee" value="<%= request.getSession().getAttribute(IConstants.SELECTED_EMPLOYEE_PARAMETER) %>"/>

<section>
	<h2>${sectionTitle}</h2>

	<c:choose>
		<c:when test="${empty selectedEmployee}">
			<p class="infoText">Employee does not exists!</p>
		</c:when>
		<c:otherwise>
			<div id="dialog-confirm" title="Update employee ${selectedEmployee.getFirstName()} ${selectedEmployee.getLastName()} ?">
				<p>
					<span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>
					Employee will be deleted and cannot be recovered. Are you sure?
				</p>
			</div>
			
			<form method="post" action="${pageContext.request.contextPath}/Employees/Update/${selectedEmployee.getID()}" 
				id="UpdateEmployeeForm">
				<fieldset>
					<legend>Personal Information</legend>
					
					<div id="UpdateAvatar">
						<c:choose>
							<c:when test="${selectedEmployee.getGender() == 'Male'}">
								<img class="searchedEmployeeImage" src="../../images/male-employee.png" alt="Employee Picture" />
							</c:when>
							<c:otherwise>
								<img class="searchedEmployeeImage" src="../../images/female-employee.png" alt="Employee Picture" />
							</c:otherwise>
						</c:choose>
					</div>
					
					<label for="FirstNameTextField">First Name (*):</label>
					<input type="text" id="FirstNameTextField" name="firstName" required 
						value="${selectedEmployee.getFirstName()}" />
					<br/>
		
					<label for="LastNameTextField">Last Name (*):</label>
					<input type="text" id="LastNameTextField" name="lastName" required
						value="${selectedEmployee.getLastName()}" />
					<br/>
					
					<label for="DateOfBirthTextField">Date of Birth (*):</label>
					<input type="date" id="DateOfBirthTextField" name="dateOfBirth" required 
						value="${selectedEmployee.getDateOfBirth()}"/>
					<br/>
					
					<input type="hidden" id="EmployeeGenderHiddenField" value="${selectedEmployee.getGender()}" />
					<label for="GenderSelectField">Gender (*):</label>
					<select id="GenderSelectField" name="gender">
						<option value="<%= Gender.Male %>" ><%= Gender.Male %></option>
						<option value="<%= Gender.Female %>"><%= Gender.Female %></option>
					</select>
					
					<label for="PhoneNumberTextField">Phone Number:</label>
					<input type="text" id="PhoneNumberTextField" name="phoneNumber" 
						value="${selectedEmployee.getPhoneNumber()}"/>
					<br/>
				</fieldset>
				
				<fieldset>
					<legend>Employee Information</legend>
					
					<label for="JobPositionTextField">Job Position:</label>
					<input type="text" id="JobPositionTextField" name="jobPosition" 
						value="${selectedEmployee.getJobPosition()}"/>
		
					<input type="hidden" id="EmployeeDepartmentHiddenField" value="${selectedEmployee.getDepartment()}" />
					<label for="DepartmentSelectField">Department (*):</label>
					<select id="DepartmentSelectField" name="department">
						<c:forEach var="department" items="<%= IConstants.DEFAULT_DEPARTMENTS %>">
							<option value="${department}">${department}</option>
						</c:forEach>
					</select>
		
					<label for="EmailAddressTextField">E-mail: Address (*):</label>
					<input type="email" id="EmailAddressTextField" name="emailAddress" required
						value="${selectedEmployee.getEmailAddress()}" />
					<br/>
				</fieldset>
				
				<input type="submit" value="Update" id="UpdateEmployeeBtn"/>
				<input type="reset" value="Clear"/>
			</form>
		</c:otherwise>
	</c:choose>
</section>