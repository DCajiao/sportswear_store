package com.sportswear_store.backend.Model;

import java.util.ArrayList;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name= "Contiene")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ContieneModel {
    @Id
    @ManyToOne
    @JoinColumn(name= "Producto_Identificacion")
    private ProductosModel Producto_Identificacion;

    @Id
    @ManyToOne
    @JoinColumn(name= "Compra_ID_compra")
    private CompraModel Compra_ID_compra;

    private Integer Cantidad;

    private ArrayList<Especificaciones_Contiene> Especificaciones;
}
