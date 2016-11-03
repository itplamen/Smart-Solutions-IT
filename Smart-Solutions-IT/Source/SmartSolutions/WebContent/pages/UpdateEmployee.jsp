<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="ct" uri="http://jwd.bg/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="../../css/style.css"/>
	<link type="text/css" rel="stylesheet" href="../../css/jquery-ui.min.css"/>
	<script type="text/javascript" src="../../js/lib/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="../../js/lib/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../../js/AutocompleteTags.js"></script>
	<title>Update Employee</title>
</head>
<body>
	<ct:Header/>
	<ct:Navigation/>
	<ct:UpdateEmployeeSection sectionTitle="Update Employee"/>
	<ct:Footer/>
	
	<script type="text/javascript" src="../../js/Message.js"></script>
	<script type="text/javascript" src="../../js/Events.js"></script>
	<script type="text/javascript" src="../../js/HttpRequest.js"></script>
	
	<script>
		$(function($) {
			
			var employeeGender = $('#EmployeeGenderHiddenField').attr('value'),
				employeeDepartment = $('#EmployeeDepartmentHiddenField').attr('value'),
				$genderOptions = $('#GenderSelectField').children(),
				$departmentOptions = $('#DepartmentSelectField').children();
		
			$.each($genderOptions, function(index, element) {
				if ($(element).attr('value') === employeeGender) {
					$(element).attr('selected', 'selected');
					return;
				}
			});
			
			$.each($departmentOptions, function(index, element) {
				if ($(element).attr('value') === employeeDepartment) {
					$(element).attr('selected', 'selected');
					return;
				}
			});
			
		}(jQuery));
	</script>
</html>