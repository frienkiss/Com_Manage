<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
<head>
<title>����Ա��¼ҳ��</title>
<script type="text/javascript">
//��֤���벻Ϊ�յĽű�����
function checkForm(form){
    if(form.username.value==""){
      alert("�û�������Ϊ�գ�");
      form.username.focus();
      return false;
      }
    if(form.password.value==""){
    	alert("���벻��Ϊ�գ�");
    	form.password.focus();
    	return false;
    	}
    return true;
    }
</script>      
</head>
<body>
    <h1 align="center">����Ա��¼</h1>
    <form method="post" action="manager_action.jsp" onsubmit="return checkForm(this);">
      <table width="361" border="1" align="center">
        <tr>
          <td width="86">��&nbsp;��&nbsp;Ա</td>
          <td width="259"><input type="text" name="username" /></td>
        </tr>
        <tr>
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
          <td><input type="password" name="password" /></td>
        <tr>
          <td colspan="2" align="center">
          <input type="submit" name="submit" value="��¼" />&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" name="reset" value="����" /></td>
        </tr>
      </table>
    </form>
</body>
</html>