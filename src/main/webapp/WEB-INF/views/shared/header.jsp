<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="rolename1" value="<%=session.getAttribute(\"rolename\")%>" />
     
        
<nav id="nav">
	<ul id="navigation" >
		<li id ="home" ><a href="${contextPath}/home">Home</a></li>
		<li id ="reports" ><a href="#">Reports&raquo;</a>
			<ul>
				
					<li id="search" ><a href="${contextPath}/search">Search</a></li>
				
					<c:if test="${rolename1 eq 'ROLE_ADMIN'}">
						<li id="searchmain"><a href="${contextPath}/searchmain">Search Main</a></li>
					</c:if>
				
					<li id="report1" ><a href="${contextPath}/get">Dynamic Report</a></li>
					<li id="rd-templatep1" ><a href="${contextPath}/dr-template-p1-get">Design Report Template</a></li>
					<li><a href="#">Identity & Branding &raquo;</a>
						<ul>
							<li><a href="#">Business Cards</a></li>
							<li><a href="#">Brochures</a></li>
							<li><a href="#">Envelopes</a></li>
							<li><a href="#">Flyers</a></li>
						</ul>					
					</li>					
				
			</ul>
		</li>
		<c:if test="${rolename1 eq 'ROLE_ADMIN'}">
			<li id="usermanagement"><a href="#">User Management &raquo;</a>
		
				 <ul>
						<li id="adduser" ><a href="${contextPath}/usermanagement/adduser">Add User</a></li>
						<li id="updateuser" ><a href="${contextPath}/usermanagement/updateuser">Update User</a></li>
						<li id="deleteuser" ><a href="${contextPath}/usermanagement/deleteuser">Delete User</a></li>
				 </ul>	
			 </li>	
		</c:if>
		
		<li> <a href="${contextPath}/logout">Logout</a></li>
	</ul>
</nav>


