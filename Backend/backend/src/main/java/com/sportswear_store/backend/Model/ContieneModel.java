package com.sportswear_store.backend.Model;

import java.util.List;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name= "contiene")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ContieneModel {
    @Id
    private Integer ID_contiene;

    @ManyToOne
    @JoinColumn(name = "Compra_ID_compra")
    private CompraModel Compra_ID_compra;

    @ManyToOne
    @JoinColumn(name = "Producto_Identificacion")
    private ProductoModel Producto_Identificacion;

    private Integer Cantidad;

    @Transient
    @ElementCollection
    private List<Especificaciones> Especificaciones;
}