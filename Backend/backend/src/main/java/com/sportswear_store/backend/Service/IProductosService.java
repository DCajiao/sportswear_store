package com.sportswear_store.backend.Service;

import com.sportswear_store.backend.Model.ProductosModel;

public interface IProductosService {
    String guardarProducto(ProductosModel producto);
    ProductosModel buscarProductoPorId(int getIdentificacion);
    void eliminarProductoPorId(ProductosModel producto);
}
