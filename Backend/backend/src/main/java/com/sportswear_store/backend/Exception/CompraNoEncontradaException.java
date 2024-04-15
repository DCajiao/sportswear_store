package com.sportswear_store.backend.Exception;


public class CompraNoEncontradaException extends RuntimeException{
    public CompraNoEncontradaException(String mensaje){
        super(mensaje);
    }
}

