package com.sportswear_store.backend.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.ProductoModel;
import com.sportswear_store.backend.Repository.IProductoRepository;

@Service
public class ProductoServiceImp implements IProductoService {

    @Autowired
    IProductoRepository productoRepository;
    @Override
    public ProductoModel buscarProductoPorId(int Identificacion) {
        Optional<ProductoModel> productoEncontrado = productoRepository.findById(Identificacion);
        return productoEncontrado.orElseThrow(()-> new RecursoNoEncontradoException("Producto no encontrado con el Id "+Identificacion));
    }
    @Override
    public String guardarProducto(ProductoModel producto) {
        productoRepository.save(producto);
        return "El producto con el Id "+producto.getIdentificacion()+" fue creado con exito";
    }
    @Override
    public List<ProductoModel> listarProductos() {
        return productoRepository.findAll();
    }
    @Override
    public String eliminarProductoPorId(int Identificacion) {
        Optional<ProductoModel> productoEncontrado = productoRepository.findById(Identificacion);
        if (productoEncontrado.isPresent()){
            productoRepository.delete(productoEncontrado.get());
            return ("El producto "+Identificacion+"fue eliminado con exito");
        } else {
            throw new RecursoNoEncontradoException("Producto no encontrado con el Id "+Identificacion);
        }
    }
    @Override
    public String actualizarProducto(int Identificacion, ProductoModel productoNuevo) {
        Optional<ProductoModel> productoEncontrado = productoRepository.findById(Identificacion);
        if (productoEncontrado.isPresent()) {
            ProductoModel producto = productoEncontrado.get();
            producto.setPrecio(productoNuevo.getPrecio());
            producto.setTipo_Articulo(productoNuevo.getTipo_Articulo());
            producto.setCantidad_Articulo(productoNuevo.getCantidad_Articulo());
            productoRepository.save(producto);
            return ("El producto " + Identificacion + " fue actualizado con éxito");
        } else {
            return ("No se pudo encontrar el producto con el Identificador " + Identificacion);
        }
    }


}