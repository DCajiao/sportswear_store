package com.sportswear_store.backend.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.PersonaModel;
import com.sportswear_store.backend.Service.IPersonaService;

@RestController
@RequestMapping ("sportswear_store/personas")
public class PersonaController {
    
    @Autowired
    IPersonaService personaService;
    
    @PostMapping ("/post")
    public ResponseEntity<String> crearUsuario(@RequestBody PersonaModel Persona){
        personaService.guardarPersona(Persona);
        return new ResponseEntity<String>(personaService.guardarPersona(Persona), HttpStatus.OK);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<PersonaModel>> listarPersonas(){
        List<PersonaModel> personas = personaService.listarPersonas();
        return new ResponseEntity<List<PersonaModel>>(personas, HttpStatus.OK);
    }

    @GetMapping("/getById")
    public ResponseEntity<?> buscarPersonaPorId(@PathVariable int Identificacion){
        try {
            PersonaModel persona = personaService.buscarPersonaporId(Identificacion);
            return ResponseEntity.ok(persona);
        } catch (RecursoNoEncontradoException e) {
            String mensajeError = e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

}
