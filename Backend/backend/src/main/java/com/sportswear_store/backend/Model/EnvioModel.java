package com.sportswear_store.backend.Model;



import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name= "Envio")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnvioModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Esto indica que el valor será generado automáticamente por la base de datos
    private Integer id_envio;
    private String Direccion;
    private int Codigo_postal;
    private Date Fecha_envio;
    @ManyToOne
    @JoinColumn(name="Compra_ID_compra")
    private CompraModel compra_ID_compra;
    @ManyToOne
    @JoinColumn(name = "Lugar_Codigo")
    private LugarModel Lugar_Codigo;
}
