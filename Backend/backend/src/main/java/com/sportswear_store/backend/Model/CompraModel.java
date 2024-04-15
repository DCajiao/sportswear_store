package com.sportswear_store.backend.Model;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name= "Compra")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompraModel {
    @Id
    private Integer ID_compra;
    private BigDecimal Costo_total;
    private Date Fecha_compra;
    @ManyToOne
    @JoinColumn(name="Cuenta_Usuario")
    private CuentaModel Cuenta_Usuario;
}

