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
		 <span class="spanh">Search Reports </span>
		</h2><br>
		<form  method ="post" action="${contextPath}/processmainreport" modelAttribute="searchvo" commandName="searchvo">
			<%--     <input type="hidden" name="empNo" value="${employee.empNo}"> --%>
    		<table style=" padding-left: 370px ;align: center;">
							  <tr>
							  		<td class="trspace"><span  class="cspan">विभाग रिपोर्ट </span></td>
                                 	<td class="trspace"> 

											<form:select path="searchvo.reportName"  required="true" class="form-control float_left">
												<form:option value="" label="--- Select Main Report ---"/>
												<c:forEach items="${searchvo.mainReportNames}" var="branch">
													<form:option value="${branch.key}"
														label="${branch.value}" />
												</c:forEach>
											</form:select>
                               		</td>
                               </tr>
                               
                               <tr style="height:25px;font-size: 15px;padding-top: 45px; ">
                               <td class="trspace"><span  class="cspan"> महीना </span></td>
                               	<td class="trspace"> 
                               
                               	<form:select path="searchvo.month"  required="true" class="form-control float_top">
										<form:option value="" label="--- महीना चुनिए ---"/>
						                  <form:option style="height:25px;font-size: 15px;" value="1" label="जनवरी"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2" label="फरवरी"  />
						                  <form:option style="height:25px;font-size: 15px;" value="3" label="मार्च"  />
						                  <form:option style="height:25px;font-size: 15px;" value="4" label="अप्रैल"  />
						                  <form:option style="height:25px;font-size: 15px;" value="5" label="मई"  />
						                  <form:option style="height:25px;font-size: 15px;" value="6" label="जून"  />
						                  <form:option style="height:25px;font-size: 15px;" value="7" label="जुलाई"  />
						                  <form:option style="height:25px;font-size: 15px;" value="8" label="फरवरी"  />
						                  <form:option style="height:25px;font-size: 15px;" value="9" label="फरवरी"  />
						                  <form:option style="height:25px;font-size: 15px;" value="10" label="फरवरी"  />
											</form:select>
											
                                
                               		</td>
                               </tr>
                               <tr>
                               <td class="trspace"><span class="cspan" > वर्ष </span></td>
                               		<td class="trspace">  
                               
                               		<form:select path="searchvo.year"  required="true" class="form-control">
												<form:option value="" label="--- वर्ष चुनें ---"/>
						                  <form:option style="height:25px;font-size: 15px;" value="2010" label="2010"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2011" label="2011"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2012" label="2012"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2013" label="2013"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2014" label="2014"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2015" label="2015"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2016" label="2016"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2017" label="2017"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2018" label="2018"  />
						                  <form:option style="height:25px;font-size: 15px;" value="2019" label="2019"  />
											</form:select>
                               
                               		</td>
                               </tr>
             </table>  
             
             <table  style="padding-top: 25px; padding-left: 350px ;align: center;border-spacing: 25px;">
							  <tr>
                                 	<td><input style="align: center;" type="submit" value="Search" class="btn btn-success"/>
                               		</td>
                               		<td><a href="${contextPath}/search" class="btn btn-info" style="align: center;">Reset</a>
                               		</td>
                               </tr>
             </table>
                                            
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		</div>
		</div>
</div>



<!-- /container -->
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/jquery.js"></script>
<script src="${contextPath}/resources/js/myapp.js"></script>
</body>

</html>
