package com.sportswear_store.backend.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
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

    @Override
    public List<PersonaModel> listarPersonas() {
        return personaRepository.findAll();
    }

    @Override
    public PersonaModel buscarPersonaporId(int Identificacion) {
        Optional <PersonaModel> personaEncontrada = personaRepository.findById(Identificacion);
        return personaEncontrada.orElseThrow(()->new RecursoNoEncontradoException("La persona con el id "+Identificacion+ " no fue encontrada"));
    }
   
}
