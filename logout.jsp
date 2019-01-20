<%@ page contentType="text/html;charset=utf-8" %>
<%
  //清除Cookie之帳號資料
  Cookie ck = new Cookie("ACCOUNT",null);
  ck.setMaxAge(0);  //指定存活0秒，表示立刻去除
  response.addCookie(ck);

  //清除session之帳號資料
  session.removeAttribute("ID");

  //回到登入畫面
  response.sendRedirect("byebye.jsp");
%>
