package com.swaca.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="incidenciasDetalleSolicitud")
public class incidenciasDetalleSolicitud {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idIncidencias")
	private Integer idIncidencias;
	
	@ManyToOne
	@JoinColumn(name="incidencias")
	private detalleSolicitudCompra idDetalleSolicitudCompra;
	
}
