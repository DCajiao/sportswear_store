package com.sportswear_store.backend.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
    public ResponseEntity<String> crearPersona(@RequestBody PersonaModel Persona){
        personaService.guardarPersona(Persona);
        return new ResponseEntity<String>(personaService.guardarPersona(Persona), HttpStatus.OK);
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

    @GetMapping("/getAll")
    public ResponseEntity<List<PersonaModel>> listarPersonas(){
        List<PersonaModel> personas = personaService.listarPersonas();
        return new ResponseEntity<List<PersonaModel>>(personas, HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<?> eliminarPersonaPorId(@PathVariable int Identificacion){
        try {
            personaService.eliminarPersonaPorId(Identificacion);
            return ResponseEntity.ok().build();
        } catch (RecursoNoEncontradoException e){
            String mensajeError = e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
   }

   @PutMapping("/put")
   public ResponseEntity<?> actualizarPersona(@PathVariable int Identificacion, @RequestBody PersonaModel persona) {
       Object personaActualizada = personaService.actualizarPersona(Identificacion, persona);
       if (personaActualizada != null) {
           return ResponseEntity.ok().body(personaActualizada);
       } else {
           return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Persona no encontrada");
       }
   }

}
