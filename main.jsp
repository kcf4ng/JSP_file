<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session="true" import="java.util.*,java.text.*, java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言板首頁</title>
</head>
<body>
    <font color="red" size="5">
    <b><i>JSP 留言板首頁</i></b>
    </font>
    <hr>
<%
Connection con=DriverManager.getConnection("jdbc:sqlserver://52.246.164.133:1433;databaseName=northwind", "lnb", "lnb");
Statement st=con.createStatement();
String strsql = "select * from tMessage ";
ResultSet rs =st.executeQuery(strsql) ; 

int num=0;

out.println("<table>");

while(rs.next()){

	out.println("<tr><td bgcolor='pink'>留言者</td><td>"+
            rs.getString("msgname")+"</td></tr>");
    out.println("<tr><td bgcolor='pink'>訊息</td><td>"+rs.getString("msgcontent")+"</td></tr>");

    out.println("<tr><td colspan=2><hr></td></tr>") ;
}

 out.println("</table><br>");
 con.close();
%>

</body>
</html>