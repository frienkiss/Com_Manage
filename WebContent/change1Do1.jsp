<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("gb2312");
    String id=request.getParameter("id");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String pwd=request.getParameter("password");
	String deptno=request.getParameter("deptno");
	//out.println(pwd+deptno);
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
try{
String url="jdbc:sqlserver://localhost:1433; DatabaseName=Company";
String username="sa";
String password="199515";
Connection conn=DriverManager.getConnection(url, username,password);
Statement stmt=conn.createStatement();
//����set   NO��������ظ�������s
String strsql="update person set No='"+no+"', Name='"+name+"', Sex='"+sex+"', Password='"+pwd+"', DeptNo='"+deptno+"' where No='"+id+"'";//�޸�No???!�ظ���ֵ
int t=stmt.executeUpdate(strsql);
if(t==0){
	%>
	<script>
	alert("�޸�ʧ��");
	history.back();
	</script>
	<%
}
else{
	response.sendRedirect("managerinfo.jsp");
}
}catch(SQLException e){
	out.println(e.getMessage());
}

%>