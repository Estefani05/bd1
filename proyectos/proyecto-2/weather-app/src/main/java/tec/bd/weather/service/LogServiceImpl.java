package tec.bd.weather.service;

import tec.bd.weather.entity.Log;
import tec.bd.weather.repository.Repository;

import java.util.List;
import java.util.Optional;

public class LogServiceImpl implements LogService {

    private Repository<Log, Integer> logRepository;

    public LogServiceImpl(Repository<Log, Integer> logRepository) {
        this.logRepository = logRepository;
    }


    @Override
    public List<Log> getAllLog() {
        return this.logRepository.findAll();
    }

   

  


}