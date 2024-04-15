package com.sportswear_store.backend.Model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name= "Lugar")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LugarModel {
    @Id
    private Integer Codigo;
    private String Nombre;


    @ManyToOne
    @JoinColumn(name = "Lugar_Codigo")
    @JsonIgnore // Evita la serialización de la referencia bidireccional
    private LugarModel lugar_Codigo;

}
