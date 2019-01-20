<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<font color="red" size="5">
<b><i>JSP 留言板</i></b></font>
<a href="home.jsp">回到留言列表</a>
<hr>
<form action="savenote.jsp" action="get">
 <table>
  <tr><td bgcolor="pink">留言者</td>
      <td><input type="text" size="20" name="name"></td>
  </tr>
  <tr><td valign="top" bgcolor="pink">訊息</td>
      <td><textarea name="note" rows="5" cols="60"></textarea></td>
  </tr>
  <tr><td colspan="2">
      <input type="submit" value="送出留言">
      <input type="reset" value="清除"></td>
  </tr>
 </table>
</form>
</body>
</html>