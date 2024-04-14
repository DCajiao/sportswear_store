package com.sportswear_store.backend.Modelo;

import java.sql.Date;

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
@Table (name= "Envio")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnvioModel {
    @Id
    private Integer ID_Envio;
    private String Direccion;
    private int Codigo_Postal;
    private Date Fecha_envio;
    


}