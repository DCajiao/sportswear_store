package com.sportswear_store.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportswear_store.backend.Model.LugarModel;

public interface ILugarRepository extends JpaRepository<LugarModel, Integer>{
    
}
