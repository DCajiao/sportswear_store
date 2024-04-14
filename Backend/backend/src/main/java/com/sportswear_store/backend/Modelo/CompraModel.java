package com.sportswear_store.backend.Modelo;

import java.math.BigDecimal; // Importa BigDecimal para manejar el tipo DECIMAL de MySQL
import java.util.Date; // Importa Date para manejar la fecha

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name= "Compra")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompraModel {
    @Id
    private Integer ID_compra;
    private BigDecimal costo_total; // Cambia a BigDecimal para coincidir con DECIMAL en MySQL
    private Date Fecha_compra;
}