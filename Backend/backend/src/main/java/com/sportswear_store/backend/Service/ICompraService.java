package com.sportswear_store.backend.Service;

import java.util.List;

import com.sportswear_store.backend.Model.CompraModel;

public interface ICompraService {

    String guardarCompra(CompraModel compra);
    CompraModel buscarCompraPorId(int ID_compra);
    List<CompraModel>listarCompras();
    String eliminarCompraPorId(int ID_compra);
    String actualizarCompra(int ID_compra, CompraModel compraNuevo);
}
