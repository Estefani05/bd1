package tec.bd.weather.service;

import tec.bd.weather.entity.City;
import tec.bd.weather.repository.Repository;

import java.util.List;
import java.util.Optional;

public class CityServiceImpl implements CityService {

    private Repository<City, Integer> cityRepository;

    public CityServiceImpl(Repository<City, Integer> cityRepository) {
        this.cityRepository = cityRepository;
    }


    @Override
    public List<City> getAllCities() {
        return this.cityRepository.findAll();
    }

    @Override
    public Optional<City> getCityById(int cityId) {
        // Validaciones. El city Id es mayor que cero?

        return this.cityRepository.findById(cityId);
    }

    @Override
    public City newCity(String cityName) {
        // No permitir que el city name sea nulo o vacio

        // Validar si el city name ya existe en la base de datos
        // para esto habria que buscar el nombre del pais cityName en la base de datos
        // y ver si existe. Si ya existe no se salva.

        var cityToBeSaved = new City(null, cityName);
        return this.cityRepository.save(cityToBeSaved);
    }

    @Override
    public void removeByCityId(int cityId) {
        // Validaciones. El city Id es mayor que cero?
        // lanza una exception

        var cityFromDBOpt = this.getCityById(cityId);

        if (cityFromDBOpt.isEmpty()) {
            throw new RuntimeException("City Id: " + cityId + " not found");
        }

        this.cityRepository.delete(cityId);
    }

    @Override
    public City updateCity(City city) {
        // validar si el city.Id existe en la base de datos
        // validar si el nombre del city ya existe en la BD

        var cityUpdated = this.cityRepository.update(city);
        return cityUpdated;
    }


}