package tec.bd.weather.repository.sql;

import tec.bd.weather.entity.Log;
import tec.bd.weather.repository.Repository;


import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class LogRepository implements Repository<Log, Integer>  {

    
    private final DataSource dataSource;

    public LogRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Optional<Log> findById(Integer logId) {
        try (Connection connection = this.dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(Queries.FIND_ALL_ObtenerBitacoras_PROC)) {

            stmt.setInt(1, logId);
            var rs = stmt.executeQuery();

            // loop through the result set
            while (rs.next()) {
                var log = new Log(rs.getInt(1), rs.getString(2));
                return Optional.of(log);
            }

            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve", e);
        }
    }


    @Override
    public Log save (Log log) {return null;}

    @Override
    public void delete (Integer integer) {

    }

    @Override
    public Log update (Log log) {return null;}

    @Override
    public List <Log> findAll(){
        return new ArrayList<>();
    }


}