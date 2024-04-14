package com.sportswear_store.backend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.ProductosModel;
import com.sportswear_store.backend.Service.IProductosService;

@RestController
@RequestMapping ("/backend/v1/productos")
public class ProductosController {
    @Autowired 
    IProductosService productosService;
    @PostMapping("/")
    public ResponseEntity<String> crearProducto(@RequestBody ProductosModel producto){
        productosService.guardarProducto(producto);
        return new ResponseEntity<String>(productosService.guardarProducto(producto),HttpStatus.OK);
    }
    @GetMapping("/{id}")
   public ResponseEntity<?> buscarProductoPorId(@PathVariable int getIdentificacion){
        try {
            ProductosModel producto = productosService.buscarProductoPorId(getIdentificacion);
            return ResponseEntity.ok(producto);
        } catch (RecursoNoEncontradoException e) {
            String mensajeError=e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
   }
   @DeleteMapping("/{id}")
   public ResponseEntity<?> eliminarProductoPorId(@PathVariable ProductosModel producto){
    try {
        productosService.eliminarProductoPorId(producto);
        return ResponseEntity.ok().build();
    } catch (RecursoNoEncontradoException e){
        String mensajeError = e.getMessage();
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
    }
   }
}
