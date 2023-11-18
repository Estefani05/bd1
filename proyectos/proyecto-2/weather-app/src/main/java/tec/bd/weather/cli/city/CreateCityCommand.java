package tec.bd.weather.cli.city;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

@CommandLine.Command(name = "city-create", aliases = {"cc"}, description = "Create new city")
public class CreateCityCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<city name>", description = "The city name")
    private String cityName;

    @Override
    public void run() {
        System.out.println("Create City Command");
        // Crear la ciudad

        var appContext = new ApplicationContext();
        var cityService = appContext.getCityService();
        var newCity = cityService.newCity(cityName);

        System.out.println("New City: " + newCity.getId() + ", " + newCity.getCityName());
    }
}