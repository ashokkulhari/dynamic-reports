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

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>		
<div class="container" style=" padding-top: 80px;">

</div>					                 
  <div class="container">
  <div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">
            <h  style=" padding-top: 45px;padding-left: 250px ;align: center;font-size:20px;">तहसील - जबलपुर भू - राजस्व वसूली की मदवार / अधिकारी वार जानकारी माह - ${reportms.monthName} - ${reportms.year}</h2> 
   			<h  style=" padding-top: 20px;padding-left: 490px ;padding-bottom: 15px;font-size:20px;"> मद - ${reportms.reportDesc}	</h2>  
        </div>	  
				                    		
      	  <form action="${contextPath}/report2"   method="POST">
        
					<table id="referralReport" class="table " >
				        <thead >
				            <tr >
				                <th class="col-xs-2" style="vertical-align: top;">अधिकारी का नाम</th>
				                <th class="col-xs-2" style="vertical-align: top;">अधिकारी जिस स्थान पर कार्यरत है </th>
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
				         <c:forEach var="reportmvo" items="${reportms.reportMVos}" varStatus="loop">
				         <form method="post" action="${contextPath}/report2" modelAttribute="reportmvo[${loop.index}]">
				                <tr>
				                    
				                    <td><span path="reportmvo[${loop.index}].userName" name="userName" id="userName" style="font-weight: bold;">${reportmvo.userName}</span>
				                    	<input type="hidden" path="reportmvo[${loop.index}].userId" name="userId" id="userId" value="${reportmvo.userId }">
				                    	<input type="hidden" path="reportmvo[${loop.index}].month" name="month" id="month" value="${reportms.month }">
				                    	<input type="hidden" path="reportmvo[${loop.index}].year" name="year" id="year" value="${reportms.year }">
				                    	<input type="hidden" path="reportmvo[${loop.index}].reportName" name="reportName" id="reportName" value="${reportms.reportName }">
				                    </td>
				                    <td><span path="reportmvo[${loop.index}].location" name="location" id="location" style="font-weight: bold;">${reportmvo.location}</span></td>
				                    <!-- td><input class="txt3" type="text"  value="0"  id="bky${loop.index}" onkeyup="sum(${loop.index})"></td -->
				                   
				                    <td><input class="txt3" path="reportmvo[${loop.index}].remApr" type="text" name="remApr" value="${reportmvo.remApr}"  id="bky${loop.index}" onkeyup="sum(${loop.index})"  style="width:75px;padding:2px"></td>
				         			<td><input class="txt4" path="reportmvo[${loop.index}].newDmdTLApr" type="text" name="newDmdTLApr" value="${reportmvo.newDmdTLApr}" id="nm${loop.index}" onkeyup="sum(${loop.index})" style="width:75px;padding: 2px"></td>
				         			
				         			<td><input class="txt5" path="reportmvo[${loop.index}].totalRecApr" type="text" name="totalRecApr" value="${reportmvo.totalRecApr}" id="sum34${loop.index}"  readonly  style="width:75px;padding: 2px"></td>
				         			
				         			<td><input class="txt6" path="reportmvo[${loop.index}].remCurrent" type="text" name="remCurrent" value="${reportmvo.remCurrent}" id="mav${loop.index}" onkeyup="sum(${loop.index})" style="width:75px;padding: 2px"></td>
				         			<td><input class="txt7" path="reportmvo[${loop.index}].newDmdCurrent" type="text"  name="newDmdCurrent" value="${reportmvo.newDmdCurrent}" id="mnm${loop.index}" onkeyup="sum(${loop.index})" style="width:75px;padding: 2px"></td>
				         	
				         			<td><input class="txt8" path="reportmvo[${loop.index}].totalRecCurrent" type="text" name="totalRecCurrent" value="${reportmvo.totalRecCurrent}" id="sum67${loop.index}"  readonly style="width:75px;padding: 2px"></td>
				         			
				         			<td><input class="txt9" path="reportmvo[${loop.index}].recLastYrTill" type="text" name="recLastYrTill" value="${reportmvo.recLastYrTill}" id="9${loop.index}" onkeyup="sum(${loop.index})" style="width:75px;padding: 2px"></td>
				         			
				         			<td><input class="txt10" path="reportmvo[${loop.index}].remLastYrTill" type="text" name="remLastYrTill" value="${reportmvo.remLastYrTill}" id="sum3-6${loop.index}"  readonly style="width:75px;padding: 2px"></td>
				         			<td><input class="txt11" path="reportmvo[${loop.index}].newDmd_Last_YrTill" type="text" name="newDmd_Last_YrTill" value="${reportmvo.newDmd_Last_YrTill}" id="sum4-7${loop.index}"  readonly style="width:75px;padding: 2px"></td>	
				         			<td><input class="txt12" path="reportmvo[${loop.index}].totalRec" type="text" name="totalRec" value="${reportmvo.totalRec}" id="sum1112${loop.index}"  readonly style="width:75px;padding: 2px"></td>			
				         	
				         		<td><!-- Button -->
                  				<button type="submit" class="btn-update">update</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				  				</td>
				                </tr>
				              </form>      
				            </c:forEach>
				         	<tr style="outline: thin solid">
				                    <td align="center"><span id="sumtotal" style="font-weight: bold;">कुल योग:</span></td>
				                    <td ></td>
				                    <td align="center"><span id="sum3" style="font-weight: bold;">${reportms.remAprTT}</span></td>
				         			<td align="center"><span id="sum4" style="font-weight: bold;">${reportms.newDmdTLAprTT}</span></td>
				         			<td align="center"><span id="sum5" style="font-weight: bold;">${reportms.totalRecAprTT}</span></td>
				         	
				         			<td align="center"><span id="sum6" style="font-weight: bold;">${reportms.remCurrentTT}</span></td>
				         			<td align="center"><span id="sum7" style="font-weight: bold;">${reportms.newDmdCurrentTT}</span></td>
				         			<td align="center"><span id="sum8" style="font-weight: bold;">${reportms.totalRecCurrentTT}</span></td>
				         	
				         			<td align="center"><span id="sum9" style="font-weight: bold;">${reportms.recLastYrTillTT}</span></td>
				         			<td align="center"><span id="sum10" style="font-weight: bold;">${reportms.remLastYrTillTT}</span></td>
				         			<td align="center"><span id="sum11" style="font-weight: bold;">${reportms.newDmd_Last_YrTillTT}</span></td>
				         			<td align="center"><span id="sum12" style="font-weight: bold;">${reportms.totalRecTT}</span></td>
				         	
				         	
				         			<td>
                                	</td>
				                </tr>
				         </tbody>
				   </table>      
			</form>	
			
			
		</div>	
	</div>
	</div>	
	
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		
		bottomSum();
		
		sum(index);
		
		gTriger();
		
	});

	function  gTriger(){
		 $(".txt5").each(function() {
				calculateSum(".txt5" ,"#sum5");
			});
		 
		 $(".txt8").each(function() {
					calculateSum(".txt8" ,"#sum8");
			});
		 
		 $(".txt10").each(function() {
					calculateSum(".txt10" ,"#sum10");
			});
			
			$(".txt11").each(function() {
					calculateSum(".txt11" ,"#sum11");
			});
			
			$(".txt12").each(function() {
					calculateSum(".txt12" ,"#sum12");
			});
	}
	function bottomSum(){
		$(".txt3").each(function() {

			$(this).keyup(function(){
				calculateSum(".txt3" ,"#sum3");
			});
		});
		
		$(".txt4").each(function() {

			$(this).keyup(function(){
				calculateSum(".txt4" ,"#sum4");
			});
		});
		
		$(".txt6").each(function() {

			$(this).keyup(function(){
				calculateSum(".txt6" ,"#sum6");
			});
		});
		
		$(".txt7").each(function() {

			$(this).keyup(function(){
				calculateSum(".txt7" ,"#sum7");
			});
		});
		
		$(".txt9").each(function() {

			$(this).keyup(function(){
				calculateSum(".txt9" ,"#sum9");
			});
		});
		
		
	}
	function sum( index) {
		
		
		var i=index;
		
		 var txt3 = document.getElementById('bky'+i).value;       
	        var txt4 = document.getElementById('nm'+i).value;
	        
	        var txt6 = document.getElementById('mav'+i).value;
	        var txt7 = document.getElementById('mnm'+i).value;
	        
	        var result34 = parseInt(txt3) + parseInt(txt4);
	        
	        var result67 = parseInt(txt6) + parseInt(txt7);
	        
	        var result36 = parseInt(txt3) - parseInt(txt6);
	        
	        //alert(' result ='+result);
	        if(!isNaN(result34)){
	        	document.getElementById('sum34'+i).value =result34.toFixed(2)
	           // $("#sum34"+i).html(result34.toFixed(2));
	        }
	        if(!isNaN(result67)){
	            document.getElementById('sum67'+i).value =result67.toFixed(2)
	            
	        }
	        
	        if(!isNaN(result36)){
	            //$("#sum3-6"+i).html(result36.toFixed(2));
	            document.getElementById('sum3-6'+i).value =result36.toFixed(2)
	            if (document.getElementById('sum3-6'+i).value < '0') {
					document.getElementById('sum3-6'+i).style.color = "red";
				}
	        }
	        gTriger();
	       
	}
	function calculateSum(txtvar , outvar) {
		
		var sum = 0;
		//iterate through each textboxes and add the values
		$(txtvar).each(function() {
			//add only if the value is number
			if(!isNaN(this.value) && this.value.length!=0) {
				sum += parseFloat(this.value);
			}
		});
		//.toFixed() method will roundoff the final sum to 2 decimal places
		$(outvar).html(sum.toFixed(2));
	}
	
	
</script>

</body>
</html>
