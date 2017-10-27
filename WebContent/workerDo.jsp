<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>个人信息管理</title>
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
//做一个过滤器，使其不能直接打开除登录界面之外的其他jsp页面

//先匹配No，找出Password
if(level.equals("user")){
	String sql="select Password from person where No='"+no+"'";
	//out.println(sql);
	ResultSet rs=stmt.executeQuery(sql);//输入编号可以成功，输入字符串任何都可以进入这个页面
	if(rs.next()){
		String pass=rs.getString(1);
		if(pass.equals(pwd)){
			%>
			
			<form method="post" name="form" action="workerDo1.jsp">
	<h4 align="left" color="red"><%=no %>员工你好，可以按日期查询你的工资</h4> <td><select name="year">
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
	<input type="submit" value="查询"/>
	</td>
	</form>
	<tr><td><a href="pass.jsp">修改密码</a></td></tr>
	
	<%
			
		}
		else{
			%>
			<script type="text/javascript">
			alert("对不起，密码错误，请重新输入！");
			history.back();
			</script>
			<% 
	}
		
	}

	else{
		%>
		<script type="text/javascript">
		alert("对不起，用户名不存在，请重新输入！");
		history.back();
		</script>
<% 
	}
}
else{
		//out.println(level);
		String sql="select Password,DeptNo from 部门领导信息   where No='"+no+"'";
		ResultSet rs=stmt.executeQuery(sql);//输入编号可以成功，输入字符串任何都可以进入这个页面
		if(rs.next()){
			String pass=rs.getString(1);
			String dept=rs.getString(2);
			if(!pass.equals(pwd)){
				%>
				<script type="text/javascript">
				alert("对不起，密码错误，请重新输入！");
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
			alert("对不起，用户名不存在，请重新输入！");
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
	
