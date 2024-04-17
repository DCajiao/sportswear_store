package com.sportswear_store.backend.Service;

import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.CompraNoEncontradaException;

import com.sportswear_store.backend.Model.CompraModel;
import com.sportswear_store.backend.Repository.ICompraRepository;

@Service
public class CompraServiceImp implements ICompraService{
    @Autowired ICompraRepository compraRepository;
    @Override
    public String guardarCompra(CompraModel compra){
        compraRepository.save(compra);
        return "La compra con el Id" + compra.getID_compra()+" fue creado con exito";
    }
    @Override
    public CompraModel buscarCompraPorId(int ID_compra){
        Optional<CompraModel> compraEncontrada = compraRepository.findById(ID_compra);
        return compraEncontrada.orElseThrow(()-> new CompraNoEncontradaException("Envio no encontrado con el Id"+ ID_compra));
    }

    @Override
    public List<CompraModel> listarCompras(){
        return compraRepository.findAll();
    }

    @Override
    public String eliminarCompraPorId(int ID_compra){
        Optional<CompraModel> compraEncontrada = compraRepository.findById(ID_compra);
        if (compraEncontrada.isPresent()){
            compraRepository.delete(compraEncontrada.get());
            return("El producto"+ ID_compra+" fue eliminado con exito");
        }else{
            throw new CompraNoEncontradaException("Compra no encontrado con el Id"+ID_compra);
        }
    }

    @Override
    public String actualizarCompra(int ID_compra, CompraModel compraNuevo){
        Optional<CompraModel> compraEncontrada = compraRepository.findById(ID_compra);
        if (compraEncontrada.isPresent()) {
            CompraModel compra = compraEncontrada.get();
            compra.setCosto_total(compraNuevo.getCosto_total());
            compra.setFecha_compra(compraNuevo.getFecha_compra());
            compra.setCuenta_Usuario(compraNuevo.getCuenta_Usuario());
            compraRepository.save(compraNuevo);
        return("La compra " + ID_compra + " fue actualizado con exito");
    } else {
            return ("No se puede crear la compra con el Identificador " + ID_compra);
        }
}
}