<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
<head>
<title>员工登录页面</title>
<script type="text/javascript">
//验证输入不为空的脚本代码
function checkForm(form){
    if(form.username.value==""){
      alert("用户名不能为空！");
      form.username.focus();
      return false;
      }
    if(form.password.value==""){
    	alert("密码不能为空！");
    	form.password.focus();
    	return false;
    	}
    return true;
    }
</script>      
</head>
<body>
    <h1 align="center">普通用户登录</h1>
    <form method="post" action="workerDo.jsp" onsubmit="return checkForm(this);">
      <table width="361" border="1" align="center">
        <tr>
          <td width="86">用&nbsp;户&nbsp;名</td>
          <td width="259"><input type="text" name="username" /></td>
        </tr>
        <tr>
          <td>密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
          <td><input type="password" name="password" /></td>
               <tr>
          <td colspan="2" align="center">
                               教师<input type="radio" name="level" value="admin">
                               学生<input type="radio" name="level" value="user" checked>
        <tr>
          <td colspan="2" align="center">
          <input type="submit" name="submit" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" name="reset" value="重置" /></td>
        </tr>
      </table>
    </form>
</body>
</html>