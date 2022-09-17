<%@page import="com.crudfinalizado.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crudfinalizado.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>


<%
	UsuarioDao.deleteUsuario(u);
    response.sendRedirect("viewsusuarios.jsp");

%>