package com.sportswear_store.backend.Service;

import java.util.List;

import com.sportswear_store.backend.Model.ContieneModel;

public interface IContieneService {
    String guardarContenido(ContieneModel contiene);// Para crear registros en la tabla
    ContieneModel buscarContenidoporId(int Id);//Para ver un registro por id
    List<ContieneModel> listarContenido(); //Para ver todos los registros de la tabla
    String eliminarContenidoPorId(int Id); //Para eliminar un registro por id
    String actualizarContenido(int Id, ContieneModel contenidoNuevo); //Para actualizar registros de la tabla
}
