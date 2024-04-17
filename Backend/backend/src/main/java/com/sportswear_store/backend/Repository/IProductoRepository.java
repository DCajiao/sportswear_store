package com.sportswear_store.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportswear_store.backend.Model.ProductoModel;

public interface IProductoRepository extends JpaRepository<ProductoModel, Integer>{
    
}
