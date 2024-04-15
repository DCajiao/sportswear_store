package com.sportswear_store.backend.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sportswear_store.backend.Exception.EnvioNoEncontradoException;
import com.sportswear_store.backend.Model.EnvioModel;
import com.sportswear_store.backend.Repository.IEnvioRepository;


@Service
public class EnvioServiceImp implements IEnvioService{
    @Autowired IEnvioRepository envioRepository;
    @Override 
    public String guardarEnvio(EnvioModel envio){
        envioRepository.save(envio);
        return "El Envio con el Id" + envio.getId_envio()+" fue creado con exito";
    }

    @Override
    public EnvioModel buscarEnvioPorId(int id_Envio){
        Optional<EnvioModel> envioEncontrado = envioRepository.findById(id_Envio);
        return envioEncontrado.orElseThrow(()-> new EnvioNoEncontradoException("Envio no encontrado con el Id"+ id_Envio));
    }

    @Override
    public List<EnvioModel> listarEnvios(){
        return envioRepository.findAll();
    }

    @Override
    public String eliminarEnvioPorId(int id_Envio){
        Optional<EnvioModel> EnvioEncontrado = envioRepository.findById(id_Envio);
        if (EnvioEncontrado.isPresent()){
            envioRepository.delete(EnvioEncontrado.get());
            return("El producto "+ id_Envio+" fue eliminado con exito");
        } else {
            throw new EnvioNoEncontradoException("Envio no encontrado con el Id"+ id_Envio);

        }
    }
    @Override
public String actualizarEnvio(int id_Envio, EnvioModel envioNuevo) {
    Optional<EnvioModel> envioEncontrado = envioRepository.findById(id_Envio);
    if (envioEncontrado.isPresent()) {
        EnvioModel envio = envioEncontrado.get();
        envio.setDireccion(envioNuevo.getDireccion());
        envio.setFecha_envio(envioNuevo.getFecha_envio());
        envio.setCodigo_postal(envioNuevo.getCodigo_postal());
        envio.setCompra_ID_compra(envioNuevo.getCompra_ID_compra()); // Actualiza el objeto de tipo CompraModel
        envio.setLugar_Codigo(envioNuevo.getLugar_Codigo()); // Actualiza el objeto de tipo LugarModel
        envioRepository.save(envio);
        return("El envio " + id_Envio + " fue actualizado con exito");
    } else {
        return ("No se puede crear el envio con el Identificador " + id_Envio);
    }
}
    
}
