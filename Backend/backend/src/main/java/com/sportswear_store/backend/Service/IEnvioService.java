package com.sportswear_store.backend.Service;
import java.util.List;

import com.sportswear_store.backend.Model.EnvioModel;

public interface IEnvioService {
    String guardarEnvio(EnvioModel envio);
    EnvioModel buscarEnvioPorId(int id_Envio);
    List<EnvioModel> listarEnvios();
    String eliminarEnvioPorId(int id_Envio);
    String actualizarEnvio(int id_Envio, EnvioModel envioNuevo);
    
}