package tec.bd.weather.repository.sql;

import tec.bd.weather.entity.City;
import tec.bd.weather.repository.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CityRepository implements Repository<City, Integer> {

    private final DataSource dataSource;

    public CityRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Optional<City> findById(Integer cityId) {
        try (Connection connection = this.dataSource.getConnection();
             CallableStatement stmt = connection.prepareCall(Queries.FIND_ALL_ObtenerCiudades_PROC)) {

            stmt.setInt(1, cityId);
            var rs = stmt.executeQuery();

            // loop through the result set
            while (rs.next()) {
                var city = new City(rs.getInt(1), rs.getString(2));
                return Optional.of(city);
            }

            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve cities", e);
        }
    }

    @Override
    public List<City> findAll() {
        List<City> allCities = new ArrayList<>();
        try (Connection connection = this.dataSource.getConnection();
             CallableStatement stmt = connection.prepareCall(Queries.FIND_ONE_BuscarCiudad_PROC)) {

            stmt.setInt(1, 0);
            var rs = stmt.executeQuery();

            // loop through the result set
            while (rs.next()) {
                var city = new City(rs.getInt(1), rs.getString(2));
                allCities.add(city);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve cities", e);
        }

        return allCities;
    }

    @Override
    public City save(City city) {
        try (Connection connection = this.dataSource.getConnection();
             CallableStatement stmt = connection.prepareCall(Queries.INSERT_InsertarCiudad_PROC)) {

            stmt.setString(1, city.getCityName());
            stmt.registerOutParameter(2, Types.INTEGER);
            stmt.executeUpdate();

            var newCity = new City(stmt.getInt(2), city.getCityName());
            return newCity;

        } catch (SQLException e) {
            throw new RuntimeException("Failed to save city", e);
        }
    }

    @Override
    public void delete(Integer cityId) {
        try (Connection connection = this.dataSource.getConnection();
             CallableStatement stmt = connection.prepareCall(Queries.DELETE_EliminarCiudad_PROC)) {

            stmt.setInt(1, cityId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Failed to delete city", e);
        }
    }

    @Override
    public City update(City city) {

        try (Connection connection = this.dataSource.getConnection();
             CallableStatement stmt = connection.prepareCall(Queries.UPDATE_ActualizarCiudad_PROC)) {

            stmt.setInt(1, city.getId());
            stmt.setString(2, city.getCityName());
            stmt.executeUpdate();

            return city;

        } catch (SQLException e) {
            throw new RuntimeException("Failed to update city", e);
        }
    }
}