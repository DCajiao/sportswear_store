package com.sportswear_store.backend.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.ProductosModel;
import com.sportswear_store.backend.Repository.IProductosRepository;

@Service
public class ProductosServiceImp implements IProductosService{
    
    @Autowired
    IProductosRepository productosRepository;
    @Override
    public String guardarProducto(ProductosModel producto) {
        productosRepository.save(producto);
        return "El producto con el Id "+producto.getIdentificacion()+" fue creado con exito";
    }
    @Override
    public ProductosModel buscarProductoPorId(int Identificacion) {
        Optional<ProductosModel> productoEncontrado = productosRepository.findById(Identificacion);
        return productoEncontrado.orElseThrow(()-> new RecursoNoEncontradoException("Producto no encontrado con el Id "+Identificacion));
    }
    @Override
    public List<ProductosModel> listarProductos() {
        return productosRepository.findAll();
    }
    @Override
    public String eliminarProductoPorId(int Identificacion) {
        Optional<ProductosModel> productoEncontrado = productosRepository.findById(Identificacion);
        if (productoEncontrado.isPresent()){
            productosRepository.delete(productoEncontrado.get());
            return ("El producto "+Identificacion+"fue eliminado con exito");
        } else {
            throw new RecursoNoEncontradoException("Producto no encontrado con el Id "+Identificacion);
        }
    }
    @Override
    public String actualizarProducto(int Identificacion, ProductosModel productoNuevo) {
        Optional<ProductosModel> productoEncontrado = productosRepository.findById(Identificacion);
        if (productoEncontrado.isPresent()) {
            ProductosModel producto = productoEncontrado.get();
            producto.setPrecio(productoNuevo.getPrecio());
            producto.setTipo_Articulo(productoNuevo.getTipo_Articulo());
            producto.setCantidad(productoNuevo.getCantidad());
            productosRepository.save(producto);
            return ("El producto " + Identificacion + " fue actualizado con éxito");
        } else {
            return ("No se pudo encontrar el producto con el Identificador " + Identificacion);
        }
    }
    
}
