package com.sportswear_store.backend.Model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor

public class Especificaciones_Contiene {
        //[{"Talla":L, "Cantidad":20},{"Talla":S, "Cantidad":20}]
    
        @JsonProperty("Talla")
        private String Talla;
    
        @JsonProperty("Cantidad")
        private int Cantidad;
        
    
}
