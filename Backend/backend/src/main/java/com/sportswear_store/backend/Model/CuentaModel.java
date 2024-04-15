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
@Table(name= "Cuenta")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class CuentaModel {
    @Id
    private String Usuario;
    
    @Column(name="Tipo")
    @Enumerated(EnumType.STRING)
    private Tipo tipo;
    private String Contraseña;
}
