<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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


							                
<body >

<div class="container">
</div>
	<div class="container">
	<br></br><br>
	<div class="left_100 right-sec-content" style="overflow: visible;">
           	<div class="left_100" style="background:#fff">
           	
		<h2 style=" padding-top: 25px;padding-left: 370px ;align: center;font-size:20px;background:#fff;">
		 <span class="spanh">User Management </span>
		</h2><br>
		
		</div>
		</div>
</div>



<!-- /container -->
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/jquery.js"></script>
<script src="${contextPath}/resources/js/myapp.js"></script>
</body>

</html>
