package com.sportswear_store.backend.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.ContieneModel;
import com.sportswear_store.backend.Repository.IContieneRepository;

@Service
public class ContieneServiceImp implements IContieneService{
    @Autowired
    IContieneRepository contieneRepository;

    @Override
    public String guardarContenido(ContieneModel contiene) {
        contieneRepository.save(contiene);
        return "El Contenido de la compra "+contiene.getCompra_ID_compra()+" fue almacenado con exito";
    }

    @Override
    public ContieneModel buscarContenidoporId(int Id) {
        Optional <ContieneModel> ContenidoEncontrado = contieneRepository.findById(Id);
        return ContenidoEncontrado.orElseThrow(()->new RecursoNoEncontradoException("El contenido de compra con el Id "+Id+ " no fue encontrado"));
        
    }


    @Override
    public List<ContieneModel> listarContenido() {
        return contieneRepository.findAll();
    }

    @Override
    public String eliminarContenidoPorId(int Id) {
        Optional<ContieneModel> contenidoEncontrado = contieneRepository.findById(Id);
        if (contenidoEncontrado.isPresent()){
            contieneRepository.delete(contenidoEncontrado.get());
            return "El contenido de compra con el Id "+Id+" fue eliminado con exito";
        } else {
            throw new RecursoNoEncontradoException("Contenido de compra no encontrado con el Id "+Id);
        }
    }

    @Override
    public String actualizarContenido(int Id, ContieneModel contenidoNuevo) {
        Optional<ContieneModel> contenidoEncontrado = contieneRepository.findById(Id);
        if (contenidoEncontrado.isPresent()) {
            ContieneModel contenido = contenidoEncontrado.get();
            contenido.setCantidad(contenidoNuevo.getCantidad());
            contenido.setEspecificaciones(contenidoNuevo.getEspecificaciones());
            
            contieneRepository.save(contenido);
            return "El contenido de la compra con el Id "+contenidoNuevo.getCompra_ID_compra()+" fue actualizado con exito"; 
        } else {
            return null;
        }
    } 
    
}
