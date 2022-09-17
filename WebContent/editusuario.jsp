<%@page import="com.crudfinalizado.dao.UsuarioDao"%>
<%@page import="com.crudfinalizado.bean.Usuario"%>
<%@page import="com.crudfinalizado.dao.UsuarioDao" %>
<jsp:useBean id="u" class="com.crudfinalizado.bean.Usuario"></jsp:useBean>
<jsp:setProperty  property="*" name="u" />

<%
	int i = UsuarioDao.updateusuario(u);
    response.sendRedirect("viewsusuarios.jsp");

%>