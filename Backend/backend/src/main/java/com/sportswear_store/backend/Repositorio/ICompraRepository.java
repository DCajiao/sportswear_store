package com.sportswear_store.backend.Repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportswear_store.backend.Modelo.CompraModel;

public interface ICompraRepository extends JpaRepository< CompraModel, Integer> {
    
}
