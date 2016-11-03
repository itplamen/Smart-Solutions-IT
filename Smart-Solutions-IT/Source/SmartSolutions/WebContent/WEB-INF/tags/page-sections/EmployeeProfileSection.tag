<%@tag import="bg.jwd.contracts.IConstants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag import="bg.jwd.models.Employee"%>
<%@tag import="java.util.List"%>

<%@ attribute name="sectionTitle" %>

<c:set var="administrator" value="<%= request.getSession().getAttribute(IConstants.USERNAME_PARAMETER) %>" />
<c:set var="selectedEmployee" value="<%= request.getSession().getAttribute(IConstants.SELECTED_EMPLOYEE_PARAMETER) %>"/>

<section>
	<c:choose>
		<c:when test="${empty selectedEmployee}">
			<h2>${sectionTitle}</h2>
			<p class="infoText">Employee does not exists!</p>
		</c:when>
		<c:otherwise>
			<div id="dialog-confirm" title="Delete employee ${selectedEmployee.getFirstName()} ${selectedEmployee.getLastName()} ?">
				<p>
					<span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>
					Employee will be permanently deleted and cannot be recovered. Are you sure?
				</p>
			</div>
		 
			<div id="SelectedEmployeeInformation">
				<div id="EmployeeNameSection">
					${selectedEmployee.getFirstName()} ${selectedEmployee.getLastName()}
				</div>
				
				<div id="AvatarPictureSection">
					<c:choose>
						<c:when test="${selectedEmployee.getGender() == 'Male'}">
							<img class="searchedEmployeeImage" src="../../images/male-employee.png" alt="Employee Picture" />
						</c:when>
						<c:otherwise>
							<img class="searchedEmployeeImage" src="../../images/female-employee.png" alt="Employee Picture" />
						</c:otherwise>
					</c:choose>
				</div>
				
				<div id="PersonalInfoSection">
					<h3>Personal Information</h3>
					<p><strong>Date of Birth: </strong>${selectedEmployee.getDateOfBirth()}</p>
					<p><strong>Gender: </strong>${selectedEmployee.getGender()}</p>
					<p><strong>Phone Number: </strong>${selectedEmployee.getPhoneNumber()}</p>
				</div>
				
				<div id="EmployeeInfoSection">
					<h3>Employee Information</h3>
					<p><strong>Job Position: </strong>${selectedEmployee.getJobPosition()}</p>
					<p><strong>Department: </strong>${selectedEmployee.getDepartment()}</p>
					<p><strong>E-mail Address: </strong>${selectedEmployee.getEmailAddress()}</p>
				</div>
				
				<c:choose>
					<c:when test="${not empty administrator}">
						<div id="UpdateDeleteEmployeeDiv">
							<a href="${pageContext.request.contextPath}/Employees/Update/${selectedEmployee.getID()}" 
							id="UpdateEmployeeHref" >
								<button>Update</button>
							</a>
							<a href="${pageContext.request.contextPath}/Employees/Profile/${selectedEmployee.getID()}
							?deleteID=${selectedEmployee.getID()}" id="DeleteEmployeeHref" >
								<button>Delete</button>
							</a>
						</div>
					</c:when>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</section>
