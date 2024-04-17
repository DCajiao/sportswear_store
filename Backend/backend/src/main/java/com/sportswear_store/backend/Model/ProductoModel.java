package com.sportswear_store.backend.Model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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

    @Transient
    @ElementCollection
    private List<Especificaciones> Especificaciones_Articulo;
    
    @Transient
    @ElementCollection
    private List<ProductosPaquete> Productos_paquete;

    private Boolean esPaquete;
}
