package com.sportswear_store.backend.Service;

import java.util.List;

import com.sportswear_store.backend.Model.LugarModel;

public interface ILugarService {
    String guardarLugar(LugarModel Lugar);// Para crear registros en la tabla
    LugarModel buscarLugarporId(int Codigo);//Para ver un registro por id
    List<LugarModel> listarLugares(); //Para ver todos los registros de la tabla 
    String eliminarLugarPorId(int Codigo); //Para eliminar un registro por id
    String actualizarLugar(int Codigo, LugarModel lugarNuevo); //Para actualizar registros de la tabla
}
