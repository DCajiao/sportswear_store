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
import com.sportswear_store.backend.Model.ProductoModel;
import com.sportswear_store.backend.Service.IProductoService;

@RestController
@RequestMapping ("/productos")
public class ProductoController {
    
    @Autowired 
    IProductoService productoService;
    @GetMapping("/{Identificacion}")
    public ResponseEntity<?> buscarProductoPorId(@PathVariable int Identificacion){
        try {
            ProductoModel producto = productoService.buscarProductoPorId(Identificacion);
            return ResponseEntity.ok(producto);
        } catch (RecursoNoEncontradoException e) {
            String mensajeError=e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
   }
   @PostMapping("/")
    public ResponseEntity<String> crearProducto(@RequestBody ProductoModel producto){
        productoService.guardarProducto(producto);
        return new ResponseEntity<String>(productoService.guardarProducto(producto),HttpStatus.OK);
    }
    @GetMapping("/")
   public ResponseEntity<List<ProductoModel>> listarProductos(){
        List<ProductoModel> productos = productoService.listarProductos();
        return new ResponseEntity<List<ProductoModel>>(productos, HttpStatus.OK);
   }
   @DeleteMapping("/{id}")
   public ResponseEntity<?> eliminarProductoPorId(@PathVariable int getIdentificacion){
    try {
        productoService.eliminarProductoPorId(getIdentificacion);
        return ResponseEntity.ok().build();
    } catch (RecursoNoEncontradoException e){
        String mensajeError = e.getMessage();
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
    }
   }
   @PutMapping("/{id}")
    public ResponseEntity<?> actualizarProducto(@PathVariable("id") int getIdentificacion, @RequestBody ProductoModel producto) {
        Object productoActualizado = productoService.actualizarProducto(getIdentificacion, producto);
        if (productoActualizado != null) {
            return ResponseEntity.ok().body(productoActualizado);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Producto no encontrado");
        }
    }


}
