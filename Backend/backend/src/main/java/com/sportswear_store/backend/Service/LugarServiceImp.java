package com.sportswear_store.backend.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportswear_store.backend.Exception.RecursoNoEncontradoException;
import com.sportswear_store.backend.Model.LugarModel;
import com.sportswear_store.backend.Repository.ILugarRepository;

@Service
public class LugarServiceImp implements ILugarService{

    @Autowired
    ILugarRepository lugarRepository;

    @Override
    public String guardarLugar(LugarModel Lugar) {
        lugarRepository.save(Lugar);
        return "El lugar "+Lugar.getNombre()+" con id "+Lugar.getCodigo()+" fue creada con exito";
    }

    @Override
    public LugarModel buscarLugarporId(int Codigo) {
        Optional <LugarModel> lugarEncontrado = lugarRepository.findById(Codigo);
        return lugarEncontrado.orElseThrow(()->new RecursoNoEncontradoException("La persona con el id "+Codigo+ " no fue encontrada"));
    }

    @Override
    public List<LugarModel> listarLugares() {
        return lugarRepository.findAll();
    }

    @Override
    public String eliminarLugarPorId(int Codigo) {
        Optional<LugarModel> lugarEncontrado = lugarRepository.findById(Codigo);
        if (lugarEncontrado.isPresent()){
            lugarRepository.delete(lugarEncontrado.get());
            return "El lugar con id "+Codigo+" fue eliminado con exito";
        } else {
            throw new RecursoNoEncontradoException("Lugar no encontrado con el Id "+Codigo);
        }
    }

    @Override
    public String actualizarLugar(int Codigo, LugarModel lugarNuevo) {
        Optional<LugarModel> lugarEncontrado = lugarRepository.findById(Codigo);
        if (lugarEncontrado.isPresent()) {
            LugarModel lugar = lugarEncontrado.get();
            lugar.setNombre(lugarNuevo.getNombre());
            lugar.setLugar_Codigo(lugarNuevo.getLugar_Codigo());
            lugarRepository.save(lugar);
            return "El lugar con id "+lugarNuevo.getCodigo()+" fue creado con exito"; 
        } else {
            return null;
        }
    }

}
