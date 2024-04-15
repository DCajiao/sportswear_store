package com.sportswear_store.backend.Controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportswear_store.backend.Exception.EnvioNoEncontradoException;
import com.sportswear_store.backend.Model.EnvioModel;
import com.sportswear_store.backend.Service.IEnvioService;


@RestController

@RequestMapping ("/envio")
public class EnvioController {

    @Autowired
    IEnvioService envioService;

    @PostMapping("/")
    public ResponseEntity<String> guardarEnvio(@RequestBody EnvioModel envio) {
    envioService.guardarEnvio(envio);
    return new ResponseEntity<String>("El Envio con el Id " + envio.getId_envio() + " fue creado con éxito", HttpStatus.OK);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<?> buscarEnvioPorId(@PathVariable int id){
        try {
            EnvioModel envio = envioService.buscarEnvioPorId(id);
            return ResponseEntity.ok(envio);
        } catch (EnvioNoEncontradoException e) {
            String mensajeError=e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

    @GetMapping("/")
    public ResponseEntity<List<EnvioModel>> listarEnvios(){
        List<EnvioModel> envios = envioService.listarEnvios();
        return new ResponseEntity<List<EnvioModel>> (envios, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminarEnvioPorId(@PathVariable int id){
        try {
            envioService.eliminarEnvioPorId(id);
            return ResponseEntity.ok().body("Se ha eliminado el registro de envío con id " + id);
        } catch (Exception e) {
            String mensajeError= e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> actualizarEnvio(@PathVariable("id") int getIdentificacion, @RequestBody EnvioModel envio){
        Object envioActualizado = envioService.actualizarEnvio(getIdentificacion, envio);
        if (envioActualizado != null){
            return ResponseEntity.ok().body(envioActualizado);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Envio no encontrado");
        }
    }
}