<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
//�����Ƿ��д��˺�
    request.setCharacterEncoding("GBK");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    //session.setAttribute("user",username); 

    if((username.equals("bobo")&&password.equals("123456"))||(username.equals("sasa")&&password.equals("111111")))
    	response.sendRedirect("manager1.jsp");
    else{
    %>
    <script type="text/javascript">
    alert("�û������벻��ȷ�����������룡");
    history.back();
    </script>
    <%
    }
%>
    
    
    