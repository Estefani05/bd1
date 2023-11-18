package tec.bd.weather.repository.sql;

import tec.bd.weather.entity.Forecast;
import tec.bd.weather.repository.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.Optional;
import java.util.logging.*;

public class ForecastRepository implements Repository<Forecast, Integer>  {

    private static final Logger LOGGER = Logger.getLogger(ForecastRepository.class.getName());

    private final DataSource dataSource;

    public ForecastRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Optional<Forecast> findById(Integer forecastId) {
        try (Connection connection = this.dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(Queries.FIND_ALL_ObtenerPronosticos_PROC)) {

            stmt.setInt(1, forecastId);
            var rs = stmt.executeQuery();

            // loop through the result set
            while (rs.next()) {
                var forecast = this.fromResultSet(rs);
                return Optional.of(forecast);
            }

            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve forecasts", e);
        }
    }

    @Override
    public List<Forecast> findAll() {

        // JDBC URL for SQLite database in src/main/resources/sqlite

        // 1. Cadena de conexion
        // String url = "jdbc:sqlite::resource:sqlite/weather-service.db";

        List<Forecast> allForecasts = new ArrayList<>();
        try (Connection connection = this.dataSource.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(Queries.FIND_ONE_BuscarPronostico_PROC)) {

            // loop through the result set
            while (rs.next()) {
                var forecast = this.fromResultSet(rs);
                allForecasts.add(forecast);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to retrieve forecast", e);
            throw new RuntimeException("Failed to retrieve forecasts", e);
        }

        return allForecasts;
    }

    @Override
    public Forecast save(Forecast forecast) {
        try (Connection connection = this.dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(Queries.INSERT_InsertarPronostico_PROC, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, forecast.getCountryName());
            stmt.setString(2, forecast.getCityName());
            stmt.setString(3, forecast.getZipCode());
            stmt.setDate(4, new java.sql.Date(forecast.getForecastDate().getTime()));
            stmt.setFloat(5, forecast.getTemperature());
            var affectedRows = stmt.executeUpdate();

            LOGGER.log(Level.INFO, "Affected Rows: {0}", affectedRows);

            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                // Get the last inserted ID
                forecast.setId(generatedKeys.getInt(1));
            }
            return forecast;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to save forecast", e);
            throw new RuntimeException("Failed to save forecast", e);
        }
    }

    @Override
    public void delete(Integer forecastId) {
        try (Connection connection = this.dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(Queries.DELETE_EliminarPronostico_PROC)) {

            stmt.setInt(1, forecastId);
            var affectedRows = stmt.executeUpdate();

            LOGGER.log(Level.INFO, "Affected Rows: {0}", affectedRows);

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to delete forecast", e);
            throw new RuntimeException("Failed to delete forecast", e);
        }
    }

    @Override
    public Forecast update(Forecast forecast) {
        try (Connection connection = this.dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(Queries.UPDATE_ActualizarPronostico_PROC)) {

            stmt.setString(1, forecast.getCountryName());
            stmt.setString(2, forecast.getCityName());
            stmt.setString(3, forecast.getZipCode());
            stmt.setDate(4, new java.sql.Date(forecast.getForecastDate().getTime()));
            stmt.setFloat(5, forecast.getTemperature());
            stmt.setInt(6, forecast.getId());
            int affectedRows = stmt.executeUpdate();

            LOGGER.log(Level.INFO, "Affected Rows: {0}", affectedRows);

            return forecast;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to update forecast", e);
            throw new RuntimeException("Failed to update forecast", e);
        }
    }

    private Forecast fromResultSet(ResultSet rs) throws SQLException {
        var forecastDate = rs.getDate("forecast_date");
        return new Forecast(
                rs.getInt("forecast_id"),
                rs.getString("country_name"),
                rs.getString("city_name"),
                rs.getString("zip_code"),
                new Date(forecastDate.getTime()),
                rs.getFloat("temperature"));
    }

}