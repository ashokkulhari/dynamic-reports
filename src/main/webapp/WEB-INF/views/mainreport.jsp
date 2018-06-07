<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<jsp:include page="/WEB-INF/views/shared/header.jsp"/>
<body>

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>		
<div class="container" style=" padding-top: 80px;">

</div>					                 
  <div class="container">
  <div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">
            <h2  style=" padding-top: 45px;padding-left: 250px ;align: center;font-size:20px;">तहसील - जबलपुर भू - राजस्व वसूली की मदवार / अधिकारी वार जानकारी माह - ${reportms.month} - ${reportms.year}</h2> 
   			<h2  style=" padding-top: 20px;padding-left: 490px ;padding-bottom: 15px;font-size:20px;"> मद - ${reportms.reportDesc}	</h2>  
        </div>	  
				                    		
      	  <form action="${contextPath}/report2"   method="POST">
        
					<table id="mainreport" class="table " >
				        <thead >
				            <tr >
				                <th class="col-xs-2" style="vertical-align: top;">मद </th>
				                <th class="col-xs-2" style="vertical-align: top;">दिनांक 1-4-${reportms.year} को बकाया</th>
				                <th class="col-xs-2" style="vertical-align: top;">दिनांक 1-4-${reportms.year} से प्रतिवेदित माह तक नई मांग</th>
				                <th class="col-xs-2" style="vertical-align: top;">कुल वसूली हेतु राशि (3+4) </th>
				                
				                <th class="col-xs-2" style="vertical-align: top; ">प्रतिवेदित माह तक में गत बकाया से की गयी वसूली </th>
				                <th class="col-xs-2" style="vertical-align: top;">प्रतिवेदित माह तक नई मांग में से की गयी वसूली </th>
				                <th class="col-xs-2" style="vertical-align: top;">कुल वसूली का योग (6+7) </th>
				                <th class="col-xs-2" style="vertical-align: top;">पिछले वर्ष से इस माह तक वसूली राशि </th>
				                <th class="col-xs-2" style="vertical-align: top;">वसूली के लिए शेष गत वर्ष की बकाया मांग से (3-6) </th>
				                
				                <th class="col-xs-2" style="vertical-align: top;">वसूली के लिए शेष राशि नई मांग से (4-7) </th>
				                <th class="col-xs-2" style="vertical-align: top;">वसूली हेतु कुल शेष राशि (11+12) </th>
				                <th class="col-xs-2" style="vertical-align: top;">कार्य </th>
				                
				                
				            </tr>
				        </thead>
				         <tbody>
				          <c:forEach var="reportmvo" items="${reportmtotals}" varStatus="loop">
				         	<form method="post" action="${contextPath}/report2" modelAttribute="reportmvo[${loop.index}]">
				                <tr>
				                    <td><span path="reportmvo[${loop.index}].reportDesc" name="reportDesc" id="reportDesc" style="font-weight: bold;">${reportmvo.reportDesc}</span>
				                    </td>
				                    
				                     <td><span path="reportmvo[${loop.index}].remAprTT" name="remAprTT" id="remAprTT" style="font-weight: bold;">${reportmvo.remAprTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].newDmdTLAprTT" name="newDmdTLAprTT" id="newDmdTLAprTT" style="font-weight: bold;">${reportmvo.newDmdTLAprTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].totalRecAprTT" name="totalRecAprTT" id="totalRecAprTT" style="font-weight: bold;">${reportmvo.totalRecAprTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].remCurrentTT" name="remCurrentTT" id="remCurrentTT" style="font-weight: bold;">${reportmvo.remCurrentTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].newDmdCurrentTT" name="newDmdCurrentTT" id="newDmdCurrentTT" style="font-weight: bold;">${reportmvo.newDmdCurrentTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].totalRecCurrentTT" name="totalRecCurrentTT" id="totalRecCurrentTT" style="font-weight: bold;">${reportmvo.totalRecCurrentTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].recLastYrTillTT" name="recLastYrTillTT" id="recLastYrTillTT" style="font-weight: bold;">${reportmvo.recLastYrTillTT}</span>
				                    </td>
				                    <td><span path="reportmvo[${loop.index}].remLastYrTillTT" name="remLastYrTillTT" id="remLastYrTillTT" style="font-weight: bold;">${reportmvo.remLastYrTillTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].newDmd_Last_YrTill" name="newDmd_Last_YrTill" id="newDmd_Last_YrTill" style="font-weight: bold;">${reportmvo.newDmd_Last_YrTillTT}</span>
				                    </td>
				                     <td><span path="reportmvo[${loop.index}].totalRecTT" name="totalRecTT" id="totalRecTT" style="font-weight: bold;">${reportmvo.totalRecTT}</span>
				                    </td>
				                     			
				         			
				         			
				         			<td><!-- Button -->
                  						<button type="submit" class="btn-update">Open</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				  					</td>
				                </tr>
				              </form>      
				            </c:forEach>
				         	
				         </tbody>
				   </table>      
			</form>	
			
			
		</div>	
	</div>
	</div>	
	
<!-- /container -->
<script src="${contextPath}/resources/js/jquery.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>



</body>
</html>
