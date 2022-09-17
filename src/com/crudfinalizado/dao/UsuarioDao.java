package com.crudfinalizado.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudfinalizado.bean.Usuario;

public class UsuarioDao {
	
	public static Connection getConnection() {
		Connection con = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudfinalizado", "root", "");

		} catch (Exception e) {
			System.out.println(e);
		}
		return con;

	}
	
	
	public static int deleteUsuario(Usuario u) {
		
		int status=0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("Delete from usuario where id=?");
			ps.setInt(1, u.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	
	
	
	
	public static int salvarUsuario(Usuario u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement)con.prepareStatement("INSERT INTO usuario "
					+ "(nome, password,email, sexo, pais) "
					+ "VALUES (?,?,?,?,?) ");
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			status = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateusuario(Usuario u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET nome=?,"
					+ "password=?,email=?,sexo=?, pais=? where id=?");
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4,u.getSexo());
			ps.setString(5,u.getPais());
			ps.setInt(6, u.getId());
			status = ps.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static Usuario getRegistroById(int id) {
		Usuario usuario = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select * from usuario where id =? ");
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				usuario = new Usuario();

				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setPassword(rs.getString("password"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return usuario;
	}
	
	
	
	
	
	public static List<Usuario> getAllUsuario() {
		List<Usuario> list = new ArrayList<Usuario>();
		try {
			Connection con = getConnection();
			
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select * from usuario");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();

				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setPassword(rs.getString("password"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));

				list.add(usuario);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	
}
