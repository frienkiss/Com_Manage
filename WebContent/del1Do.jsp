<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*,java.util.*"%>
<html>
<head><title>��תҳ��</title>
</head>
<%
	request.setCharacterEncoding("gb2312");
	String no=request.getParameter("no");
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
	String strsql="select No from person where No='"+no+"'";
	ResultSet rs=stmt.executeQuery(strsql);//֮ǰд��executeQuery������ʾû�з��ؽ����
	if(!rs.next()){

		%>
	<script type="text/javascript">
	alert("�����ڴ˱�ţ����������룡");
	history.back();
	</script>
<%
	
	}
	else{
		strsql="delete from person where No='"+no+"'";
		stmt.executeUpdate(strsql);
		%>
		<script>
		alert("ɾ���ɹ���������תҳ��..");
		//����history.back()
		</script>
		<%
		response.sendRedirect("managerinfo.jsp");//��java���ԣ�����д��<%����
	}
}catch(SQLException e){
	out.println(e.getMessage());
}
%>
</html>
