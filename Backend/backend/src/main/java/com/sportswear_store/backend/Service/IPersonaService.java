package com.sportswear_store.backend.Service;


import java.util.List;

import com.sportswear_store.backend.Model.PersonaModel;

public interface IPersonaService {
    String guardarPersona(PersonaModel Persona);// Para crear registros en la tabla
    PersonaModel buscarPersonaporId(int Identificacion);//Para ver un registro por id
    List<PersonaModel> listarPersonas(); //Para ver todos los registros de la tabla
    String eliminarPersonaPorId(int Identificacion); //Para eliminar un registro por id
    String actualizarPersona(int Identificacion, PersonaModel personaNueva); //Para actualizar registros de la tabla
}
