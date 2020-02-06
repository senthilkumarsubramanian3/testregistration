  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<style>  
.error{color:red}  
</style>  
<style>
 #grad1 {
  height: 200px;
  background-color: #cccccc;
  background-image: linear-gradient(#4CFF33, skyblue);
} 
</style>
<style>
.btn {
  background-color: #273746  ;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
}
.btn:hover {opacity: 1}
</style>
<!--  <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
  <!--            <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script> -->
</head>
<body style="background-color:skyblue;">
<!--  <script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script> -->
<td><input  class="btn" type="button" value="Back" onclick="history.go(-1);" /></td>
<div id="grad1"> 
	<form:form action="loginSubmit" method="post" modelAttribute="login" >
		<center>
		<h1>Login Page</h1>
			<p>${sent} </p>
			<table>
				<tr>
					<td> <spring:message code="label.username"/></td>
					<td><form:input  path="name" /></td>	
					<td><form:errors path="name" cssClass="error"/></td> 				
				</tr>
				<tr>
					<td> <spring:message code="label.password"/></td>
					
					<td><form:password path="password" showPassword="true" /></td>
					<td><form:errors path="password" cssClass="error"/></td> 	
					<p>${passwordwrong }</p>				
				</tr>
				<tr>
					<td><input type="submit" value="Submit" /></td>
					<td><INPUT TYPE="button" onClick="history.go(0)" VALUE="Refresh"></td>
				</tr>
				
			</table>
			
		</center>
	</form:form>
	</div>
</body>
</html> 