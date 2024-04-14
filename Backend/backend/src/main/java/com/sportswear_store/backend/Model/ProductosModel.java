package com.sportswear_store.backend.Model;

import javax.json.Json;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name="usuario")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ProductosModel {
    @Id
    private Integer Identificacion;
    private Float precio;
    private String Imagen_producto;
    @Column(name = "Tipo")
    @Enumerated(EnumType.STRING)
    private Tipo Tipo;
    @Column(name="Tipo_Articulo")
    @Enumerated(EnumType.STRING)
    private TipoArticulo Tipo_Articulo;
    @Column(name = "Seccion")
    @Enumerated(EnumType.STRING)
    private Seccion Seccion;
    private Integer Cantidad;
    private Json Especificaciones;
}
