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
import com.sportswear_store.backend.Model.ContieneModel;
import com.sportswear_store.backend.Service.IContieneService;

@RestController
@RequestMapping("/contenidos")
public class ContieneController {
    @Autowired
    IContieneService contieneService;

    @PostMapping ("/")
    public ResponseEntity<String> crearContenido(@RequestBody ContieneModel Contenido){
        contieneService.guardarContenido(Contenido);
        return new ResponseEntity<String>(contieneService.guardarContenido(Contenido), HttpStatus.OK);
    }

    @GetMapping("/{Id}")
    public ResponseEntity<?> buscarContendidoPorId(@PathVariable int Id){
        try {
            ContieneModel Contenido = contieneService.buscarContenidoporId(Id);
            return ResponseEntity.ok(Contenido);
        } catch (RecursoNoEncontradoException e) {
            String mensajeError = e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

    @GetMapping("/")
    public ResponseEntity<List<ContieneModel>> listarContenido(){
        List<ContieneModel> Contenido = contieneService.listarContenido();
        return new ResponseEntity<List<ContieneModel>>(Contenido, HttpStatus.OK);
    }

    @DeleteMapping("/{Id}")
    public ResponseEntity<?> eliminarContenidoPorId(@PathVariable int Id){
        try {
            contieneService.eliminarContenidoPorId(Id);
            return ResponseEntity.ok().build();
        } catch (RecursoNoEncontradoException e){
            String mensajeError = e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
   }

   @PutMapping("/{Id}")
   public ResponseEntity<?> actualizarContenido(@PathVariable int Id, @RequestBody ContieneModel Contenido) {
       Object ContenidoActualizado = contieneService.actualizarContenido(Id, Contenido);
       if (ContenidoActualizado != null) {
           return ResponseEntity.ok().body(ContenidoActualizado);
       } else {
           return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Contenido de compra no encontrado");
       }
   }
}
