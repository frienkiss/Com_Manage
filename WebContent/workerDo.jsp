<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>������Ϣ����</title>
</head>
<%	request.setCharacterEncoding("gb2312");
//String level2=request.getParameter("level2");
//out.println(level2);
String level=request.getParameter("level");


String no=request.getParameter("username");
String pwd=request.getParameter("password");
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
%>
<%
//��һ����������ʹ�䲻��ֱ�Ӵ򿪳���¼����֮�������jspҳ��

//��ƥ��No���ҳ�Password
if(level.equals("user")){
	String sql="select Password from person where No='"+no+"'";
	//out.println(sql);
	ResultSet rs=stmt.executeQuery(sql);//�����ſ��Գɹ��������ַ����κζ����Խ������ҳ��
	if(rs.next()){
		String pass=rs.getString(1);
		if(pass.equals(pwd)){
			%>
			
			<form method="post" name="form" action="workerDo1.jsp">
	<h4 align="left" color="red"><%=no %>Ա����ã����԰����ڲ�ѯ��Ĺ���</h4> <td><select name="year">
	<%session.setAttribute("no", no);%>
	<option selected="selected">2016</option>
	<option>2015</option>
	<option>2014</option>
	<option>2013</option>
	<option>2012</option>
	<option>2011</option>
	</select></td>
	<td><select name="month">
	<option select="selected">1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	<option>11</option>
	<option>12</option></select></td>
	<td>
	<input type="submit" value="��ѯ"/>
	</td>
	</form>
	<tr><td><a href="pass.jsp">�޸�����</a></td></tr>
	
	<%
			
		}
		else{
			%>
			<script type="text/javascript">
			alert("�Բ�������������������룡");
			history.back();
			</script>
			<% 
	}
		
	}

	else{
		%>
		<script type="text/javascript">
		alert("�Բ����û��������ڣ����������룡");
		history.back();
		</script>
<% 
	}
}
else{
		//out.println(level);
		String sql="select Password,DeptNo from �����쵼��Ϣ   where No='"+no+"'";
		ResultSet rs=stmt.executeQuery(sql);//�����ſ��Գɹ��������ַ����κζ����Խ������ҳ��
		if(rs.next()){
			String pass=rs.getString(1);
			String dept=rs.getString(2);
			if(!pass.equals(pwd)){
				%>
				<script type="text/javascript">
				alert("�Բ�������������������룡");
				history.back();
				</script>
				<% 
			}
			else{
				session.setAttribute("dept", dept);
				response.sendRedirect("admin.jsp");
			}
		}
		else{
			%>
			<script type="text/javascript">
			alert("�Բ����û��������ڣ����������룡");
			history.back();
			</script>
	<% 
		}
}
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>
	</html>
	
