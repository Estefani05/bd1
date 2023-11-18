package tec.bd.weather.app;

import picocli.CommandLine;

public class WeatherApp {
    public static void main(String[] args) {
        
        CommandLine cmd = new CommandLine(new MainCommand());
        cmd.setExecutionStrategy(new CommandLine.RunAll());
        cmd.execute(args);
        
        if (args.length = 0) {
            cmd.usage(System.out);
        }
        
        
        
        
        //WeatherService weatherService = new WeatherServiceImpl();
        //System.out.println(weatherService.getTemperature("Hello World!"));
    }
}
