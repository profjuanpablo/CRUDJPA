<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição de usuários</title>
</head>
<body>
<%@ page import ="com.crudfinalizado.dao.UsuarioDao, com.crudfinalizado.bean.*"%>
 
<%
	String id = request.getParameter("id");
	Usuario usuario = UsuarioDao.getRegistroById(Integer.parseInt(id));

%>
 
</body>
</html>