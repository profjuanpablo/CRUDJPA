<%@page import="com.crudfinalizado.dao.UsuarioDao" %>
<jsp:useBean id="u" class="com.crudfinalizado.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	int i = UsuarioDao.salvarUsuario(u);
		if(i>0){
			response.sendRedirect("addusuario-success.jsp");
		} else {
			response.sendRedirect("addusuario-erro.jsp");
		}


%>>