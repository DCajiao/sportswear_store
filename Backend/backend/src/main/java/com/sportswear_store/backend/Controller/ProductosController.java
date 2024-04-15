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
import com.sportswear_store.backend.Model.ProductosModel;
import com.sportswear_store.backend.Service.IProductosService;

@RestController
@RequestMapping ("/back/nat/productos")
public class ProductosController {
    @Autowired 
    IProductosService productosService;
    @PostMapping("/")
    public ResponseEntity<String> crearProducto(@RequestBody ProductosModel producto){
        productosService.guardarProducto(producto);
        return new ResponseEntity<String>(productosService.guardarProducto(producto),HttpStatus.OK);
    }
    @GetMapping("/{id}")
   public ResponseEntity<?> buscarProductoPorId(@PathVariable int Identificacion){
        try {
            ProductosModel producto = productosService.buscarProductoPorId(Identificacion);
            return ResponseEntity.ok(producto);
        } catch (RecursoNoEncontradoException e) {
            String mensajeError=e.getMessage();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
        }
   }
   @GetMapping("/")
   public ResponseEntity<List<ProductosModel>> listarProductos(){
        List<ProductosModel> productos = productosService.listarProductos();
        return new ResponseEntity<List<ProductosModel>> (productos, HttpStatus.OK);
   }
   @DeleteMapping("/{id}")
   public ResponseEntity<?> eliminarProductoPorId(@PathVariable int getIdentificacion){
    try {
        productosService.eliminarProductoPorId(getIdentificacion);
        return ResponseEntity.ok().build();
    } catch (RecursoNoEncontradoException e){
        String mensajeError = e.getMessage();
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(mensajeError);
    }
   }
   @PutMapping("/{id}")
    public ResponseEntity<?> actualizarProducto(@PathVariable("id") int getIdentificacion, @RequestBody ProductosModel producto) {
        ProductosModel productoActualizado = productosService.actualizarProducto(getIdentificacion, producto);
        if (productoActualizado != null) {
            return ResponseEntity.ok().body(productoActualizado);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Producto no encontrado");
        }
    }
}
