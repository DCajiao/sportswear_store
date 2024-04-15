package com.sportswear_store.backend.Service;


import java.util.List;

import com.sportswear_store.backend.Model.ProductosModel;

public interface IProductosService {
    String guardarProducto(ProductosModel producto);
    ProductosModel buscarProductoPorId(int Identificacion);
    List<ProductosModel> listarProductos();
    String eliminarProductoPorId(int Identificacion);
    String actualizarProducto(int Identificacion, ProductosModel productoNuevo);
}
