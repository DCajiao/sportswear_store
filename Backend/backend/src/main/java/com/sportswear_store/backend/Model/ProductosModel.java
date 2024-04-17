package com.sportswear_store.backend.Model;

import java.util.ArrayList;

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
@Table (name="producto")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ProductosModel {
    @Id
    private Integer Identificacion;

    private Float precio;

    private String Imagen_producto;

    @Column(name = "Tipo_Producto")
    @Enumerated(EnumType.STRING)
    private TipoProducto Tipo;

    @Column(name="Tipo_Articulo")
    @Enumerated(EnumType.STRING)
    private TipoArticulo Tipo_Articulo;

    @Column(name = "Seccion")
    @Enumerated(EnumType.STRING)
    private Seccion Seccion;

    private Integer Cantidad;
    
    @Column(name = "Productos_paquete", columnDefinition = "JSON")
    private ArrayList<Productos_Paquete> Productos_paquete;

    @Column(name = "Especificaciones_Articulo", columnDefinition = "JSON")
    private ArrayList<Especificaciones_Articulo> Especificaciones_Articulo;

    @Column(name = "esPaquete")
    private Boolean esPaquete;
}
