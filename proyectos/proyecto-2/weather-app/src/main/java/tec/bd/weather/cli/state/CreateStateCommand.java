package tec.bd.weather.cli.state;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

@CommandLine.Command(name = "state-create", aliases = {"cc"}, description = "Create new state")
public class CreateStateCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<country name>", description = "The country name")
    private String stateName;

    @Override
    public void run() {
        System.out.println("Create State Command");

        var appContext = new ApplicationContext();
        var stateService = appContext.getStateService();
        var newState = stateService.newState(stateName);
        System.out.println("New State: " + newState.getId() + ", " + newState.getStateName());
    }
}