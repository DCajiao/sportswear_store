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
public class ProductoModel {
    @Id
    private Integer Identificacion;
    private Float precio;
    private String Imagen_producto;

    @Column(name="Tipo_Producto")
    @Enumerated(EnumType.STRING)
    private TipoProducto Tipo_producto;

    @Column(name="Tipo_Articulo")
    @Enumerated(EnumType.STRING)
    private TipoArticulo Tipo_Articulo;

    @Column(name="Seccion_Articulo")
    @Enumerated(EnumType.STRING)
    private SeccionArticulo Seccion_Articulo;

    private Integer Cantidad_Articulo;

    @Column(name = "Especificaciones_Articulo", columnDefinition = "JSON")
    private ArrayList<EspecificacionesArticulo> Especificaciones_Articulo;

    @Column(name="Productos_paquete", columnDefinition = "JSON")
    private ArrayList<ProductosPaquete> Productos_paquete;

    private Boolean esPaquete;
}
