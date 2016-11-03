<%@page import="bg.jwd.contracts.IConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="ct" uri="http://jwd.bg/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="../css/style.css"/>
	<link type="text/css" rel="stylesheet" href="../css/jquery-ui.min.css"/>
	<script type="text/javascript" src="../js/lib/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="../js/lib/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/AutocompleteTags.js"></script>
	<script type="text/javascript" src="../js/HttpRequest.js"></script>
	<title>Add Employee</title>
</head>
<body>
	<ct:Header/>
	<ct:Navigation/>
	<ct:AddEmployeeSection sectionTitle="Add New Employee"/>
	<ct:Footer/>
	
	<script type="text/javascript" src="../js/Message.js"></script>
	<script type="text/javascript" src="../js/Events.js"></script>
	
	<script>
		(function($) {
			var phoneNumber = '${phoneNumber}',
				emailAddress = '${emailAddress}',
				$addEmployeeForm = $('#AddEmployeeForm');
				
			if (phoneNumber !== '<%= IConstants.INVALID_PARAMETER %>' && 
					emailAddress !== '' && emailAddress !== '<%= IConstants.INVALID_PARAMETER %>' &&
					emailAddress !== '<%= IConstants.EMAIL_ALREADY_EXISTS %>') {
				
				Message.displaySuccessMessage($addEmployeeForm, 'New employee has been added!');
				return;
			}	
				
			if (phoneNumber === '<%= IConstants.INVALID_PARAMETER %>') {
				Message.displayErrorMessage($addEmployeeForm, 'Invalid phone number!');
			}
			
			if (emailAddress === '<%= IConstants.INVALID_PARAMETER %>') {
				Message.displayErrorMessage($addEmployeeForm, 'Invalid e-mail address!');
			}
			
			if (emailAddress === '<%= IConstants.EMAIL_ALREADY_EXISTS %>') {
				Message.displayErrorMessage($addEmployeeForm, 'E-mail address already exists!');
			}
			
			$(window).on('beforeunload', function() {
				Message.deleteMessages();
				
				<% 
					request.getSession().setAttribute(IConstants.PHONE_NUMBER_PARAMETER, "");
					request.getSession().setAttribute(IConstants.EMAIL_ADDRESS_PARAMETER, "");
				%>
			});
		}(jQuery));
	</script>
</body>
</html>