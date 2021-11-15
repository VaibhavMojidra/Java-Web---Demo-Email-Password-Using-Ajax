<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String user=request.getParameter("US");
String pass=request.getParameter("PWD");

String Host="jdbc:sqlserver://localhost\\VAIBHAV:1433;databaseName=ForPrachuu";
String UserN="sa";
String UserP="vahbiav";
try {
    
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection conn= DriverManager.getConnection(Host,UserN,UserP);
    Statement smt=conn.createStatement();
    ResultSet rs= smt.executeQuery("SELECT * FROM UserDetails where Username='"+user+"'");
    if(rs.next()){
    	if(rs.getString(2).equals(pass)){
    		out.print("LSF");	
    	}
    	else{
    		out.print("INP");
    	}
    }
    else
    {
    	out.print("UNF");
    }
}catch(Exception e){ 
    out.print("SER");
}
%>
</body>
</html>