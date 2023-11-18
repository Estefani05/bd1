package tec.bd.weather.entity;

import java.util.Date;

public class State {

    private Integer id;
    private String stateName;

    public State(Integer id, String stateName) {
        this.id = id;
        this.stateName = stateName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }
}