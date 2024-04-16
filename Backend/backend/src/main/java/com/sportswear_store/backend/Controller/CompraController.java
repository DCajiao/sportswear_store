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

import com.sportswear_store.backend.Exception.CompraNoEncontradaException;
import com.sportswear_store.backend.Model.CompraModel;
import com.sportswear_store.backend.Service.ICompraService;

@RestController
@RequestMapping ("/compra")
public class CompraController {
    
    @Autowired
    ICompraService compraService;

    @PostMapping("/")
    public ResponseEntity<String> guardarCompra (@RequestBody CompraModel compra){
        compraService.guardarCompra(compra);
        return new ResponseEntity<String>("La compra con el Id" + compra.getID_compra()+ " fue creado con exito", HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscarCompraPorId(@PathVariable int id){
        try {
            CompraModel compra = compraService.buscarCompraPorId(id);
            return ResponseEntity.ok(compra);
        } catch (CompraNoEncontradaException e){
            String mensajeError=e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

    @GetMapping("/")
    public ResponseEntity<List<CompraModel>> listarCompras(){
        List<CompraModel> compras= compraService.listarCompras();
        return new ResponseEntity<List<CompraModel>> (compras, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminarCompraPorId(@PathVariable int id){
        try{
            compraService.eliminarCompraPorId(id);
            return ResponseEntity.ok().body("Se ha eliminado el registro de envio con id"+id);
        } catch(Exception e){
            String mensajeError= e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> actualizarCompra(@PathVariable("id") int getIdentificacion, @RequestBody CompraModel compra){
        Object CompraActualizada = compraService.actualizarCompra(getIdentificacion, compra);
        if (CompraActualizada != null) {
            return ResponseEntity.ok().body(CompraActualizada);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Compra no encontrada");
        }
    }

}