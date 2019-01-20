<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="uft-8"/>
</head>
<body>
  <%@ page contentType="text/html;charset=utf-8" %>
  <%
    //先判斷Cookie是否已有登入的使用者紀錄
    Cookie[] cks = request.getCookies();
    if (cks !=null){
      boolean flagCookie=false;  //true表示有登入帳號
      for (int i=0; i<cks.length; i++){
        if (cks[i].getName().equals("ACCOUNT")){
          flagCookie=true;
          session.setAttribute("ID",cks[i].getValue() );
          break;
        }
      }

      if ( flagCookie ) 
        //已經有登入紀錄，直接導向至首頁
        response.sendRedirect("home.jsp");
    }
  %>
  <form action="verify.jsp" method="post" >
    帳號：<input type="text" name="user" /><br/>
    密碼：<input type="password" name="pwd" /><br/>
  <input type="checkbox" name="keep" value="YES" />保持登入
  <input type="submit" value="登入" />
</body>
</form>
</html>