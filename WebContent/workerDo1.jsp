<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>������Ϣ</title>
</head>
<body>
<h4 align="right" color="blue"><a href="worker.jsp">�˳�</a></h4>
		<table width="600" border="1" align="center">
		<tr>
			<td bgcolor="#A9D0F5" scope="col">����</td>	
			<td bgcolor="#A9D0F5" scope="col">��������</td>
			<td bgcolor="#A9D0F5" scope="col">����</td>
			<td bgcolor="#A9D0F5" scope="col">�۳�</td>
		    <td bgcolor="#A9D0F5" scope="col">ʵ�ʹ���</td>
			<td bgcolor="#A9D0F5" scope="clo">����</td>
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
	String strsql="select Name,Year,Month,Base,Bonus,Deduct,Fact from pay1 where No='"+no+"' and  Year="+year+" and Month='"+month+"'";//��and����������++???���üӺź�˫���ţ�������Ҳ���ӣ�year��int�͵ġ�����
	ResultSet rs=stmt.executeQuery(strsql);
	//1->Name 2->Year
	if(!rs.next())
	{
		%>
		<script>
		alert("����û�й���");
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
