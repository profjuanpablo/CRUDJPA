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
 id numero: <%=usuario.getId() %>
 
 <form action="editusuario.jsp" method="post">
	Id <input type="text" name ="id" value="<%= usuario.getId()%>" /><br>
	Nome <input type="text" name ="nome" value="<%= usuario.getNome()%>" /><br>
	Password <input type="password" name ="password" value="<%= usuario.getPassword()%>" /><br>
	Email <input type="text" name ="email" value="<%= usuario.getEmail()%>" /><br>
	Sexo 
	 <input type="radio" name ="sexo" value="<%= usuario.getSexo() %>"  />Masculino
	 <input type="radio" name ="sexo" value="<%= usuario.getSexo() %>" />Feminino<br>
	País 
	 <select name="pais">
	 	<option>Brasil</option>
	 	<option>Argentina</option>
	 	<option>Chile</option>
	 	<option>EUA</option>
	 </select>
	
<input type="submit" value="Atualizar">
</form>
</body>
</html>