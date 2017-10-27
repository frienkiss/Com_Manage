<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
//检验是否有此账号
    request.setCharacterEncoding("GBK");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    //session.setAttribute("user",username); 

    if((username.equals("bobo")&&password.equals("123456"))||(username.equals("sasa")&&password.equals("111111")))
    	response.sendRedirect("manager1.jsp");
    else{
    %>
    <script type="text/javascript">
    alert("用户或密码不正确，请重新输入！");
    history.back();
    </script>
    <%
    }
%>
    
    
    