package com.sportswear_store.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportswear_store.backend.Model.ProductosModel;

public interface IProductosRepository extends JpaRepository<ProductosModel, Integer>{
    
}
