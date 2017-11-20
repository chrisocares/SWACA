package com.swaca.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.model.Usuario;

@Service
public class usuarioDaoImplement implements usuarioDao{

	@PersistenceContext
	private EntityManager em;
	
	@Transactional
	public Boolean login(Usuario usuario, String rolUsuario, HttpSession session) {
		boolean result;
		Query query = em.createQuery("SELECT u FROM Usuario u JOIN u.rol r WHERE u.correo =:correo AND u.contraseña =:contraseña AND r.descripcionRol =:nombreRol");
		query.setParameter("correo", usuario.getCorreo());
		query.setParameter("contraseña", usuario.getContraseña());
	//	query.setParameter("estadoUsuario", "1");
		query.setParameter("nombreRol", rolUsuario);
		
		try {
			Usuario user = (Usuario) query.getSingleResult();
			session.setAttribute("idUser", user.getIdUsuario());
			String querySQL = "SELECT u FROM Usuario u WHERE u.idUsuario =:idUser AND u.estadoUsuario =:estadoUsuario";
			Query qSesiones = em.createQuery(querySQL);
			qSesiones.setParameter("idUser", user.getIdUsuario());
			qSesiones.setParameter("estadoUsuario", "1");
			Usuario userx = (Usuario) qSesiones.getSingleResult();
			session.setAttribute("idEmpleado", userx.getIdUsuario());
			session.setAttribute("Nombres", userx.getApellido()+" "+userx.getNombre());
			session.setAttribute("Rol", userx.getRol().getDescripcionRol());
			session.setAttribute("Tienda",userx.getIdTienda().getDescripcion());
			session.setAttribute("Usuario",userx);
			
			result = true;
			
		} catch (NoResultException nre) {
			result = false;
		}
		
		return result;
	}

}
