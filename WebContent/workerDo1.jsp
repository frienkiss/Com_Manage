<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>工资信息</title>
</head>
<body>
<h4 align="right" color="blue"><a href="worker.jsp">退出</a></h4>
		<table width="600" border="1" align="center">
		<tr>
			<td bgcolor="#A9D0F5" scope="col">姓名</td>	
			<td bgcolor="#A9D0F5" scope="col">基本工资</td>
			<td bgcolor="#A9D0F5" scope="col">奖金</td>
			<td bgcolor="#A9D0F5" scope="col">扣除</td>
		    <td bgcolor="#A9D0F5" scope="col">实际工资</td>
			<td bgcolor="#A9D0F5" scope="clo">日期</td>
		</tr>
<%
	request.setCharacterEncoding("gb2312");
    String year=request.getParameter("year");
    String month=request.getParameter("month");
    String no=(String)session.getAttribute("no");
    //out.println(no);
	//int year=Integer.parseInt(request.getParameter("year"));
	//int month=Integer.parseInt(request.getParameter("month"));
	//out.println("year");
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
	String strsql="select Name,Year,Month,Base,Bonus,Deduct,Fact from pay1 where No='"+no+"' and  Year="+year+" and Month='"+month+"'";//用and！！！！！++???不用加号和双引号？单引号也不加？year是int型的。。。
	ResultSet rs=stmt.executeQuery(strsql);
	//1->Name 2->Year
	if(!rs.next())
	{
		%>
		<script>
		alert("该月没有工资");
		history.back();
		</script>
		<%
	}
	while(rs.next()){
		String name=rs.getString(1);
		String date=rs.getString(2)+"/"+rs.getString(3);
		String base=rs.getString(4);
		String bonus=rs.getString(5);
		String deduct=rs.getString(6); 
		String fact=rs.getString(7);
	%>
	 <tr>
			<td height="22" align="center"><%=name %></td>
			<td height="22" align="center"><%=base %></td>
			<td height="22" align="center"><%=bonus %></td>
			<td height="22" align="center"><%=deduct %></td>
			<td height="22" align="center"><%=fact %></td>
			<td height="22" align="center"><%=date %></td>
</tr>
	<%
				}
			}
			catch(SQLException e){
				out.println(e.getMessage());
			}
		%>
