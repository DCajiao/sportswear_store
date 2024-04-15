package com.sportswear_store.backend.Exception;

public class EnvioNoEncontradoException extends RuntimeException{
    public EnvioNoEncontradoException(String mensaje){
        super(mensaje);
    }
}
