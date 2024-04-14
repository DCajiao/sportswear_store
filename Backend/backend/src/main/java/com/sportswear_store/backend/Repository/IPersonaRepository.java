package com.sportswear_store.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportswear_store.backend.Model.PersonaModel;

public interface IPersonaRepository extends JpaRepository<PersonaModel, Integer> {
    
}
