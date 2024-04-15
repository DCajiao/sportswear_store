package com.sportswear_store.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportswear_store.backend.Model.EnvioModel;

public interface IEnvioRepository extends JpaRepository <EnvioModel, Integer> {

    
}
