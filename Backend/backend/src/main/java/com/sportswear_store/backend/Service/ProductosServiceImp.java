package com.sportswear_store.backend.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.ProductosModel;
import com.sportswear_store.backend.Repositorio.IProductosRepository;

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
    public ProductosModel buscarProductoPorId(int getIdentificacion) {
        Optional<ProductosModel> productoEncontrado = productosRepository.findById(getIdentificacion);
        return productoEncontrado.orElseThrow(()-> new RecursoNoEncontradoException("Producto no encontrado con el Id "+getIdentificacion));
    }
    @Override
    public void eliminarProductoPorId(int getIdentificacion) {
        Optional<ProductosModel> productoEncontrado = productosRepository.findById(getIdentificacion);
        if (productoEncontrado.isPresent()){
            productosRepository.delete(productoEncontrado.get());
        } else {
            throw new RecursoNoEncontradoException("Producto no encontrado con el Id "+getIdentificacion);
        }
    }
    @Override
    public ProductosModel actualizarProducto(int getIdentificacion, ProductosModel productoNuevo) {
        Optional<ProductosModel> productoEncontrado = productosRepository.findById(getIdentificacion);
        if (productoEncontrado.isPresent()) {
            ProductosModel producto = productoEncontrado.get();
            producto.setPrecio(productoNuevo.getPrecio());
            producto.setTipo(productoNuevo.getTipo());
            producto.setEspecificaciones(productoNuevo.getEspecificaciones());
            producto.setCantidad(productoNuevo.getCantidad());
            return productosRepository.save(producto);
        } else {
            return null;
        }
    }
}
