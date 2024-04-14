package com.sportswear_store.backend.Model;

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
@Table (name = "persona")
@Data
@AllArgsConstructor
@NoArgsConstructor
//Creacion de la tabla persona
public class PersonaModel {
    @Id
    private Integer Identificacion;
    private String Nombre;
    private String Correo; 
    private String Telefono;
    @Column(name = "Genero")
    @Enumerated(EnumType.STRING) //Implementacion del ENUM de MySQL
    private Genero Genero;
    private Integer Edad;    
}
