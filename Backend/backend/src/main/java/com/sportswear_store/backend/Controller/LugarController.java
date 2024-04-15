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
import com.sportswear_store.backend.Model.LugarModel;
import com.sportswear_store.backend.Service.ILugarService;

@RestController
@RequestMapping ("sportswear_store/lugar")
public class LugarController {
    
    @Autowired
    ILugarService lugarService;

    @PostMapping ("/post")
    public ResponseEntity<String> crearLugar(@RequestBody LugarModel Lugar){
        lugarService.guardarLugar(Lugar);
        return new ResponseEntity<String>(lugarService.guardarLugar(Lugar), HttpStatus.OK);
    }

    @GetMapping("/getById")
    public ResponseEntity<?> buscarLugarPorId(@PathVariable int Codigo){
        try {
            LugarModel lugar = lugarService.buscarLugarporId(Codigo);
            return ResponseEntity.ok(lugar);
        } catch (RecursoNoEncontradoException e) {
            String mensajeError = e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<LugarModel>> listarLugares(){
        List<LugarModel> lugares = lugarService.listarLugares();
        return new ResponseEntity<List<LugarModel>>(lugares, HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<?> eliminarLugarPorId(@PathVariable int Codigo){
        try {
            lugarService.eliminarLugarPorId(Codigo);
            return ResponseEntity.ok().build();
        } catch (RecursoNoEncontradoException e){
            String mensajeError = e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
   }

   @PutMapping("/put")
   public ResponseEntity<?> actualizarLugar(@PathVariable int Codigo, @RequestBody LugarModel lugar) {
       Object lugarActualizado = lugarService.actualizarLugar(Codigo, lugar);
       if (lugarActualizado != null) {
           return ResponseEntity.ok().body(lugarActualizado);
       } else {
           return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Lugar no encontrado");
       }
   }
}
