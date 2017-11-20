package com.swaca.dao;

import javax.servlet.http.HttpSession;

import com.swaca.model.Usuario;

public interface usuarioDao {
	public Boolean login(Usuario usuario, String rolUsuario,HttpSession session);
}
