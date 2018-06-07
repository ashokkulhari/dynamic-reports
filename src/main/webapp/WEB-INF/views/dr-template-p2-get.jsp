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
	<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
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
		 
		</h2><br>
		<form:form  method ="post" action="${contextPath}/savetemplate" modelAttribute="contactForm" commandName="contactForm">
			<table>
				<tr>
					<td style="padding-left:250px;padding-bottom:30px;"><h2><span class="spanhh2">Create Report</span></h2>
					</td>
					
				</tr>
			</table>
			
			
    		<table style=" padding-left: 250px ;align: center;">
    		
    						<tr>
							  		<td class="trspace"><span  class="cspan">Report Name</span></td>
                                 	<td class="trspace"> 
                                 	
						            	<div class="form-group">
							                <form:input type="text"   path="reportName" class="form-control" 
							                            autofocus="true" readonly="true" ></form:input>
							            </div>
							       
                               		</td>
                               		
                               		<td class="trspace"><span  class="cspan">Report Name In Hindi</span></td>
                                 	<td class="trspace"> 
						            	<div class="form-group">
							                <form:input type="text" path="reportNameDesc" class="form-control" 
							                            autofocus="true" readonly="true" ></form:input>
							            </div>
                               		</td>
                               </tr>
                               
                              <tr>
                              <td class="trspace"><span  class="cspan">Column Name</span></td>
                              <td class="trspace"><span  class="cspan">Column Name In Hindi</span></td>
                              
                              <td class="trspace"><span  class="cspan">Column A</span></td>
                              <td class="trspace"><span  class="cspan">Column B</span></td>
                              <td class="trspace"><span  class="cspan">Operation</span></td>
                              </tr> 
    				<c:forEach items="${contactForm.contacts}" var="contact" varStatus="loop">
							 <tr>
							  		
                                 	<td class="trspace"> 
						            	<div class="form-group">
							                <form:input type="text"  path="contacts[${loop.index}].colName" name="contacts[${loop.index}].colName" class="form-control" 
							                            autofocus="true" readonly="true" value="${contact.colName}"></form:input>
							            </div>
                               		</td>
                               		
                               		
                                 	<td class="trspace"> 
						            	<div class="form-group">
							                <form:input type="text" path="contacts[${loop.index}].colDesc" class="form-control" 
							                            autofocus="true" readonly="true"></form:input>
							            </div>
                               		</td>
                               		
                               		<td class="trspace"> 
						            	<div class="form-group">
							                <form:select path="contacts[${loop.index}].colNameA"  id="colA${loop.index}"  class="form-control float_top" onchange="selectioncol('colA' ,${loop.index})" >
												<form:option value="" label="---Select ColA---"/>
						                  		<c:forEach items="${contactForm.contacts}" var="branch">
													<form:option value="${branch.colName}"
														label="${branch.colName}" />
												</c:forEach>
											</form:select>            
							                            
							            </div>
                               		</td>
                               		<td class="trspace"> 
						            	<div class="form-group">
							                <form:select path="contacts[${loop.index}].colNameB"  id="colB${loop.index}" class="form-control float_top" onchange="selectioncol('colB',${loop.index})">
												<form:option value="" label="--- Select ColB---"/>
						                  		<c:forEach items="${contactForm.contacts}" var="branch">
													<form:option value="${branch.colName}"
														label="${branch.colName}" />
												</c:forEach>
											</form:select>
							            </div>
                               		</td>
                               		
                               		<td class="trspace"> 
						            	<div class="form-group">
							                
							                 <form:select path="contacts[${loop.index}].operation" id="oper${loop.index}"  class="form-control float_top" onchange="selection(${loop.index})">
												<form:option value="" label="--- Select Operation---"/>
						                  		<form:option style="height:25px;font-size: 15px;" value="1" label="Add"  />
						                  		<form:option style="height:25px;font-size: 15px;" value="2" label="Sub"  />
											</form:select>
											
							            </div>
                               		</td>
                               </tr>
                   </c:forEach>            
             </table>
             	<div style="padding-left: 250px ; padding-top: 30px ;">
             		<button class="spanhh3" type="submit">Save Template</button>                             
               		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
             	</div>
               
		</form:form>
		</div>
		</div>
</div>

<script type="text/javascript">

function selection(index)
{alert('index  =' +index);
 var operation = document.getElementById('oper'+index).value;
    if (operation == "1" || operation == "2") {
    	var selectedvalueA =document.getElementById('colA'+index).value;
    	var selectedvalueB =document.getElementById('colB'+index).value;
        if (selectedvalueA == ""  || selectedvalueA == "---Select ColA---") {
            alert('Column A is Mandatory');
            document.getElementById('colA'+index).required = true;
            document.getElementById('colA'+index).style.color = "red";
        }else{
        	 document.getElementById('colA'+index).required = false;
             document.getElementById('colA'+index).style.color = "black";
        }
        
        if (selectedvalueB == ""  || selectedvalueB == "---Select ColB---") {
            alert('Column B is  Mandatory');
            document.getElementById('colB'+index).required = true;
            document.getElementById('colB'+index).style.color = "red";
        }else{
        	document.getElementById('colB'+index).required = false;
            document.getElementById('colB'+index).style.color = "black";
        }
    }else{
    	document.getElementById('colA'+index).required = false;
        document.getElementById('colA'+index).style.color = "black";
        document.getElementById('colB'+index).required = false;
        document.getElementById('colB'+index).style.color = "black";
        $("#colA"+index).children('required').remove();
        $("#colB"+index).children('required').remove();
    }
}

function selectioncol(name , index)
{alert(name + '  index  =' +index);
    	var selectedvalueA =document.getElementById(name+index).value;
        if (selectedvalueA != "" ) {
             document.getElementById(name+index).style.color = "black";
        }
}

</script>

<!-- /container -->
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/myapp.js"></script>
</body>

</html>
