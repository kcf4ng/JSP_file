<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"
	import="java.util.*,java.text.*, java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<%
	String id = request.getParameter("user");
	String pwd = request.getParameter("pwd");
	String remain = request.getParameter("keep");
	Connection con = null;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con = DriverManager.getConnection("jdbc:sqlserver://52.246.164.133:1433;database=northwind", "lnb",
				"lnb");
	} catch (Exception e) {
		out.println("無法連結資料庫");
	}

	PreparedStatement pst = con.prepareStatement("select * from customer where id=?");
	pst.setString(1, id);
	ResultSet rs = pst.executeQuery();
	if (rs.next()) { //將指標移到第一筆紀錄，實際也應該只有一筆紀錄
		String realPwd = rs.getString("password"); //取出資料錄的密碼欄位內容
		if (realPwd.equals(pwd)) {
			//帳號與密碼正確 
			session.setAttribute("ID", id);
			//設定Cookie
			if (remain != null) {
				Cookie ck = new Cookie("ACCOUNT", id);
				ck.setMaxAge(99999); //設一個大數，儲存久久
				response.addCookie(ck);
			}
			//導向首頁
			response.sendRedirect("home.jsp");
		}
	}
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

</body>
</html>