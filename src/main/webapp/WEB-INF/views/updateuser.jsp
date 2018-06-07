<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title}</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script >
		window.menu ='${title}';
	</script>
</head>
<jsp:include page="/WEB-INF/views/shared/header.jsp"/>
<body>

<div class="container">

    <form:form method="POST" modelAttribute="userForm"  commandName="userForm" class="form-reg">
        <h2 class="form-signin-heading">Update account</h2>
        
        <spring:bind path="userForm.users">
        <div class="form-group ${status.error ? 'has-error' : ''}">
        		<form:select path="user"  required="true" class="form-control"  placeholder=" Select User "  onchange="myFunc(value)" >
					<form:option value="" label=" Select User "  class="form-control" />
					<c:forEach items="${userForm.users}" var="branch">
					<form:option value="${branch.username},${branch.userDisplayName},${branch.designation},${branch.district_id}  "	label="${branch.userDisplayName}" />
					</c:forEach>
				</form:select>
		</div>		
		</spring:bind>	
		
        <spring:bind path="userForm.user.username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" id = 'username' path="user.username" class="form-control" placeholder="Username (in English Only)" required="true"
                            autofocus="true" value="${user.username}" onchange="validate(value)" ></form:input>
                <form:errors path="user.username"></form:errors>
            </div>
        </spring:bind>

		<spring:bind path="userForm.user.userDisplayName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" id ='userDisplayName' path="user.userDisplayName" class="form-control" placeholder="User Display Name (Hindi or English)" required="true"
                            autofocus="true"></form:input>
                <form:errors path="user.username"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="userForm.districts">
        <div class="form-group ${status.error ? 'has-error' : ''}">
        		<form:select id ="district_id" path="user.district_id"  required="true" class="form-control"  placeholder=" Select District Location " >
					<form:option value="" label=" Select District Location "  class="form-control" />
					<c:forEach items="${userForm.districts}" var="branch">
					<form:option value="${branch.id}"	label="${branch.discription}" />
					</c:forEach>
				</form:select>
		</div>		
		</spring:bind>									
											
        <spring:bind path="userForm.user.designation">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" id ='designation' path="user.designation" class="form-control" placeholder="Designation (Hindi or English)" required="true"
                            autofocus="true"></form:input>
                <form:errors path="user.username"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="userForm.user.password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="user.password" class="form-control" placeholder="Password" required="true" ></form:input>
                <form:errors path="user.password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="userForm.user.passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="user.passwordConfirm" class="form-control"
                            placeholder="Confirm your password" required="true" ></form:input>
                <form:errors path="user.passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		
		//myFunc();
		
	});
	
	function myFunc($user) {
       
        var user1 = $user;
        //alert(user1);
        //${branch.username},${branch.userDisplayName},${branch.designation},${branch.district_id}
        var str_array = user1.split(',');
        var disid = +str_array[3];
        document.getElementById("username").value = str_array[0];
        document.getElementById("userDisplayName").value = str_array[1];
        document.getElementById("designation").value = str_array[2];
        document.getElementById("district_id").value = disid;
       }
	
	function validate($input) {
		//alert($input);
		var inputstring=$input;
		//var regex = '/^[a-zA-Z ]{2,30}$/';
		//if (!inputstring.match('[a-zA-Z]{2}\d{3}[a-zA-Z0-9]{1}')) {
		//	  alert('Non-english chars detected.');
		//	}
	}
</script>	
	
</body>
</html>
