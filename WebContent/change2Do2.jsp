<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("gb2312");
	String id=request.getParameter("id");
	String name1=request.getParameter("num");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String num=request.getParameter("id1");
	String peo=request.getParameter("peo");
	String pwd=request.getParameter("pwd");
	out.println(id);
	out.println(name1);
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
	String 
	sql="update ������Ϣ��  set ���ű��='"+no+"', ��������='"+name+"'  where ���ű��='"+id+"'";
	//System.out.println(sql);
	int t=stmt.executeUpdate(sql);//����
	if(t==0){
		%>
		<script>
		alert("�޸�ʧ��");
		history.back();
		</script>
		<%
	}
	else{
		sql="update �����쵼��Ϣ set No='"+num+"',Name='"+peo+"',Password='"+pwd+"',DeptNo='"+name+"' where Name='"+name1+"' ";
		System.out.println(sql);
		int m=stmt.executeUpdate(sql);
		if(m==0){
			%>
			<script>
			alert("�޸�ʧ��!!!!!");
			history.back();
			</script>
			<%
		}else{
		response.sendRedirect("deptNo.jsp");
		}
	}
	}catch(SQLException e){
		out.println(e.getMessage());
	}


%>
