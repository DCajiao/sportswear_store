package com.sportswear_store.backend.Service;

import java.util.List;

import com.sportswear_store.backend.Model.ProductoModel;

public interface IProductoService {
    ProductoModel buscarProductoPorId(int Identificacion);
    String guardarProducto(ProductoModel producto);
    List<ProductoModel> listarProductos();
    String eliminarProductoPorId(int Identificacion);
    String actualizarProducto(int Identificacion, ProductoModel productoNuevo);
}
