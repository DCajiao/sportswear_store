package com.sportswear_store.backend.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Model.PersonaModel;
import com.sportswear_store.backend.Repository.IPersonaRepository;

@Service
public class PersonaServiceImp implements IPersonaService{
    
    @Autowired
    IPersonaRepository personaRepository;

    @Override
    public String guardarPersona(PersonaModel Persona) {
        personaRepository.save(Persona);
        return "La persona "+Persona.getNombre()+" con id "+Persona.getIdentificacion()+" fue creada con exito";
    }

}
