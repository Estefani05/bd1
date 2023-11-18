package tec.bd.weather.repository.sql;

public class Queries {

    public static final String FIND_ALL_LOGS_PROC = "call ObtenerBitacoras()";

    //Forecast

    public static final String FIND_ALL_ObtenerPronosticos_PROC = "call ObtenerPronosticos()";
    public static final String FIND_ONE_BuscarPronostico_PROC = "call BuscarPronostico(?)";
    public static final String DELETE_EliminarPronostico_PROC = "call EliminarPronostico(?)";
    public static final String INSERT_InsertarPronostico_PROC = "call InsertarPronostico(?, ?, ? , ?)";
    public static final String UPDATE_ActualizarPronostico_PROC = "call ActualizarPronostico(?, ?, ?, ?, ?)";


    // Forecast_log

     public static final String FIND_ALL_ObtenerBitacoras_PROC = "call ObtenerBitacoras()";
    
    // Country crear en la base de datos

    public static final String FIND_ALL_ObtenerPaises_PROC = "call ObtenerPaises()";
    public static final String FIND_ONE_BuscarPais_PROC = "call BuscarPais(?)";
    public static final String DELETE_EliminarPais_PROC = "call EliminarPais(?)";
    public static final String INSERT_InsertarPais_PROC = "call InsertarPais(?)";
    public static final String UPDATE_ActualizarPais_PROC = "call ActualizarPais(?,?)";

    // State

    public static final String FIND_ALL_ObtenerEstados_PROC = "call ObtenerEstados()";
    public static final String FIND_ONE_BuscarEstado_PROC = "call BuscarEstado(?)";
    public static final String DELETE_EliminarEstado_PROC = "call EliminarEstado(?)";
    public static final String INSERT_InsertarEstado_PROC = "call InsertarEstado(?)";
    public static final String UPDATE_ActualizarEstado_PROC = "call ActualizarEstado(?, ?)";

    // City


    public static final String FIND_ALL_ObtenerCiudades_PROC = "call ObtenerCiudades()";
    public static final String FIND_ONE_BuscarCiudad_PROC = "call BuscarCiudad(?)";
    public static final String DELETE_EliminarCiudad_PROC = "call EliminarCiudad(?)";
    public static final String INSERT_InsertarCiudad_PROC = "call InsertarCiudad(?, ?)";
    public static final String UPDATE_ActualizarCiudad_PROC = "call ActualizarCiudad(?, ?, ?)";

}