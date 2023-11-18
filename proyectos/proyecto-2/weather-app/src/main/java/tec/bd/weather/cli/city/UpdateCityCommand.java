package tec.bd.weather.cli.city;

import picocli.CommandLine;

@CommandLine.Command(name = "city-update", aliases = {"cu"}, description = "Update city")
public class UpdateCityCommand implements Runnable {

    @Override
    public void run() {
        System.out.println("Update city");
    }
}