<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*,java.util.*" %>
<html>
<head><title>��תҳ��...</title>
</head>
<body>
<%
	request.setCharacterEncoding("gb2312");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String num=request.getParameter("num");
	String name1=request.getParameter("name1");
	String pwd=request.getParameter("pwd");
	String address=request.getParameter("address");
	out.println(no);
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
		//String no=request.getParameter("No");
		String sql="select * from ������Ϣ��  where ���ű��='"+no+"'";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
		%>
		<script>
		alert("��Ա������Ѵ��ڣ�");
		history.back();
		</script>
		<%
		}else{
		sql="insert into ������Ϣ��  values('"+no+"','"+name+"','"+address+"')";
		stmt.executeUpdate(sql);
		
		sql="insert into �����쵼��Ϣ values('"+num+"','"+name1+"','"+pwd+"','"+name+"')";
		stmt.executeUpdate(sql);
		response.sendRedirect("deptNo.jsp");
		}
		
		}	catch(SQLException e){
				out.println(e.getMessage());
			}
			
	%>
	</body>
	</html>