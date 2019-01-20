<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="uft-8"/>
</head>
<body>
  <%@ page contentType="text/html;charset=utf-8"  import="java.util.*,java.text.*,java.sql.*"%>
  <%
    String id = (String)session.getAttribute("ID");
    if ( id == null)
      //尚未登入，直接進入網頁頁面
      response.sendRedirect("login.jsp");
    else{
      out.print("<table>");
      out.print("<tr><td>"+ id+" 歡迎光臨</td>");
  %>
      <td>
        <form action="logout.jsp">
           <input type="submit" value="登出" />
        </form>
      </td></table>
      <hr/>
      <h3>JSP 留言板首頁</h3>
  <%
    }
  %>
  
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
  
<ul>
<li> <a href="msg.jsp">留言</a></li> </ul>
</body>
</html>
