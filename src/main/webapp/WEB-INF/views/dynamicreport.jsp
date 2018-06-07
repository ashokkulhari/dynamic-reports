<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

    <title>Report1</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
	<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<jsp:include page="/WEB-INF/views/shared/header.jsp"/>
<body>

<div class="container" style=" padding-top: 80px;">

</div>					                 
  <div class="container">
  <div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">
            <h2  style=" padding-top: 45px;padding-left: 250px ;align: center;font-size:20px;">तहसील - जबलपुर भू - राजस्व वसूली की मदवार / अधिकारी वार जानकारी माह </h2> 
   			<h2  style=" padding-top: 20px;padding-left: 490px ;padding-bottom: 15px;font-size:20px;"> मद - 	</h2>  
        </div>	  
				                    		
      	 <form:form action="${contextPath}/save" modelAttribute="contactForm"  method="POST">
        
						<table>
						<tr>
							
								<th class="col-xs-2" style="vertical-align: top;">अधिकारी का नाम</th>
				                <th class="col-xs-2" style="vertical-align: top;">अधिकारी जिस स्थान पर कार्यरत है </th>
				                
				                <c:forEach items="${contactForm.contacts}" var="contact" varStatus="status">
				                <th class="col-xs-2" style="vertical-align: top;">
									${contact.colDesc}
								</th>	
								</c:forEach>
								
				                
						</tr>
						<c:forEach items="${contactForm.conactForms}" var="contactFms" varStatus="loop">
							<tr>
								<td align="center">पंकज मिश्रा - तहसीलदार</td>
								<td align="center">जबलपुर
								
								</td>
							<c:forEach items="${contactForm.conactForms[loop.index].contacts}" var="contact" varStatus="status">
									<td><input name="conactForms[${loop.index}].contacts[${status.index}].colNameVal" value="${contact.colNameVal}"/>
										<form:input type="hidden" path="conactForms[${loop.index}].contacts[${status.index}].colName" value="${contact.colName}"/>
										<form:input type="hidden" path="conactForms[${loop.index}].contacts[${status.index}].colDesc" value="${contact.colDesc}"/>
										<form:input type="hidden" path="conactForms[${loop.index}].contacts[${status.index}].operation" value="${contact.operation}"/>
										<form:input type="hidden" path="conactForms[${loop.index}].contacts[${status.index}].colNameA" value="${contact.colNameA}"/>
										<form:input type="hidden" path="conactForms[${loop.index}].contacts[${status.index}].colNameB" value="${contact.colNameB}"/>
									</td>
							</c:forEach>
							</tr>
						</c:forEach>
					</table>	
					<br/>
					<div  style="padding-left :405px;" >
						<input style="align: center;" type="submit" value="Calculate" class="btn btn-success "/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</div>
				    
	</form:form>
			
			
		</div>	
	</div>
	</div>	
	
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>



</body>
</html>
