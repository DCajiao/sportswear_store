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
    public PersonaModel buscarPersonaporId(int Identificacion) {
        Optional <PersonaModel> personaEncontrada = personaRepository.findById(Identificacion);
        return personaEncontrada.orElseThrow(()->new RecursoNoEncontradoException("La persona con el id "+Identificacion+ " no fue encontrada"));
    }

    @Override
    public List<PersonaModel> listarPersonas() {
        return personaRepository.findAll();
    }

    @Override
    public String eliminarPersonaPorId(int Identificacion) {
        Optional<PersonaModel> personaEncontrada = personaRepository.findById(Identificacion);
        if (personaEncontrada.isPresent()){
            personaRepository.delete(personaEncontrada.get());
            return "La persona con id "+Identificacion+" fue eliminado con exito";
        } else {
            throw new RecursoNoEncontradoException("Persona no encontrada con el Id "+Identificacion);
        }
    }

    @Override
    public String actualizarPersona(int Identificacion, PersonaModel personaNueva) {
        Optional<PersonaModel> personaEncontrada = personaRepository.findById(Identificacion);
        if (personaEncontrada.isPresent()) {
            PersonaModel persona = personaEncontrada.get();
            persona.setNombre(personaNueva.getNombre());
            persona.setCorreo(personaNueva.getCorreo());
            persona.setTelefono(personaNueva.getTelefono());
            persona.setGenero(personaNueva.getGenero());
            persona.setEdad(personaNueva.getEdad());
            persona.setLugar_Codigo(personaNueva.getLugar_Codigo());
            personaRepository.save(persona);
            return "La persona con id "+personaNueva.getIdentificacion()+" fue creada con exito"; 
        } else {
            return null;
        }
    }
}

