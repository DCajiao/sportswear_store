package com.sportswear_store.backend.Model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Especificaciones_Articulo {
    @JsonProperty("Talla")
    private String Talla;

    @JsonProperty("Cantidad")
    private int Cantidad;
    
}
