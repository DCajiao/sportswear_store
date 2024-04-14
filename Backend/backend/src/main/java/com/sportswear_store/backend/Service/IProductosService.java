package com.sportswear_store.backend.Service;

import java.util.List;

import com.sportswear_store.backend.Model.ProductosModel;

public interface IProductosService {
    String guardarProducto(ProductosModel producto);
    ProductosModel buscarProductoPorId(int getIdentificacion);
    List<ProductosModel> listarUsuarios();
    void eliminarProductoPorId(int getIdentificacion);
    ProductosModel actualizarProducto(int getIdentificacion, ProductosModel productoNuevo);
}
