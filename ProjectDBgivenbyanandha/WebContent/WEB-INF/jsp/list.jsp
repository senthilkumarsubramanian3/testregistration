 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import='java.*'%>
<%@ page import='com.cts.vo.LoginVO'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data View Page</title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
header {
  background-color: #666;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}
article {
  -webkit-flex: 3;
  -ms-flex: 3;
  flex: 3;
  background-color: #f1f1f1;
  padding: 10px;
}
body {
  background-color: #5D6D7E;
  padding: 10px;

}
</style>
<style>
.btn {
  background-color:#EC7063;
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
</head>
<body>
<td><input  class="btn" type="button" value="Back" onclick="history.go(-1);" /></td>
<form action="get" method="get" modelAttribute="getmodel" >
<center>	
<header>
  <h2>Details</h2>
</header>
  <article>
 <%--  <jsp:useBean id="data" class="com.cts.vo.LoginVO"></jsp:useBean> 
  <jsp:getProperty property="name" name="data"/><br>   --%>
<table>
	<% 
	LoginVO obj1=new LoginVO();
			String s=obj1.getName(); 	
		
	%>	
<%
try
{

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/Project?autoReconnect=true&useSSL=false";
String username="root";
String password="root";
String query="select * from demo1 WHERE Id=('"+s+"')";

Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

 if (rs.next() == false) {
	out.print("There is no test registered"); 
}
 else{
/* while(rs.next())
{ */
%>
   <tr> <td><%=rs.getString("Id") %></td>
     <td><%=rs.getString("Date") %></td>
      <td><%=rs.getString("Place") %></td>
       <td><%=rs.getString("Slot") %></td>
        <td><%=rs.getString("Level") %></td></tr>
        <%
/* } */
 }

%>
    </table>
    </article>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
%>
</center>
</form>
</body>
</html> 