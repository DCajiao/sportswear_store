package com.sportswear_store.backend.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name= "lugar")
@Data
@AllArgsConstructor
@NoArgsConstructor

// Creacion de la tabla Lugar
public class LugarModel {
    @Id
    private Integer Codigo;
    private String Nombre;
    @ManyToOne // Relacion reflexiva de la tabla 
    @JoinColumn(name = "Codigo")
    private LugarModel Lugar_Codigo;
}
