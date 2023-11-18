package tec.bd.weather.app;

public interface WeatherService {
   
    float getCityTemperature(String city); 
    float getZipCodeTemperature(String zipCode);
}
