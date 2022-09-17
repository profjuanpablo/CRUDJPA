
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar Usuários</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<%@ page import ="com.crudfinalizado.dao.UsuarioDao, com.crudfinalizado.bean.*, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
	

<h1>Listagem de usuarios</h1>
<div class="container">
<%
	List<Usuario> list = UsuarioDao.getAllUsuario();
	
	request.setAttribute("list",list);
%>
 
	<a href="addusuarioform.jsp" class="btn btn-primary">Adicionar Novo Usuário</a>
	<hr>
	
	
	<table class="table table-striped">
		<tr class="table-dark">
			<th>Id</th>
			<th>Nome</th>
			<th>Password</th>
			<th>Email</th>
			<th>Sexo</th>
			<th>Pais</th>
			<th colspan="2">Ações</th>
		</tr>
		<c:forEach items = "${list}" var="usuario">
			
			<tr>
				<td>${usuario.getId()}</td>
				<td>${usuario.getNome()}</td>
				<td>${usuario.getPassword()}</td>
				<td>${usuario.getEmail()}</td>
				<td>${usuario.getSexo()}</td>
				<td>${usuario.getPais()}</td>
				<td><a href="editform.jsp?id=${usuario.getId() }" class="btn">
				   <img src="edit.png" width="16px">
				</a></td>
				
				<td><a href="deleteusuario.jsp?id=${usuario.getId() }" class="btn"><img src="trash.png" width="16px"></a></td>
			</tr>
		</c:forEach>
		
		
	</table>
	
<br>
 
</div>
</body>
</html>