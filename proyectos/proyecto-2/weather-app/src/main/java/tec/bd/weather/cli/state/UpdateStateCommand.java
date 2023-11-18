package tec.bd.weather.cli.state;

import picocli.CommandLine;

@CommandLine.Command(name = "state-update", aliases = {"cu"}, description = "Update state")
public class UpdateStateCommand implements Runnable {

    @Override
    public void run() {
        System.out.println("Update state");
    }
}