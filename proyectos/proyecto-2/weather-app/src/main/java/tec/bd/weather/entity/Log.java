package tec.bd.weather.entity;

import java.util.Date;

public class Log {

    private Integer id;
    private String logName;

    public Log(Integer id, String logName) {
        this.id = id;
        this.logName = logName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogName() {
        return logName;
    }

    public void setLogName(String logName) {
        this.logName = logName;
    }
}