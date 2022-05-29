import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class AddGitBashEnvironmentVariable {

    public static void main(String[] args) {
        if (args.length != 2) {
            throw new IllegalArgumentException("There are exactly 2 arguments required, a variable name and a variable value.");
        }
        
        if (args[0].isBlank()) {
            throw new IllegalArgumentException("The environment variable name must not be blank!");
        }
        
        if (args[0].contains(" ") || args[0].contains("\t")) {
            throw new IllegalArgumentException("The environment variable name must not contain spaces or tabs!");
        }
        
        String variableName = args[0];
        String variableValue = args[1].replace("\"", "");
        Path bashConfig = Path.of(System.getenv("USERPROFILE")).resolve(".bashrc");
        new AddGitBashEnvironmentVariable(bashConfig).run(variableName, variableValue);
    }

    private final Path configFile;
    
    public AddGitBashEnvironmentVariable(Path bashrcFile) {
        this.configFile = bashrcFile;
    }
    
    private void run(String variableName, String newValue) {
        String variableValue = adjustToGitPath(newValue);
        List<String> lines = loadConfiguration();
        configureWith(variableName, variableValue, lines);
        createBackupIfNeeded();
        saveConfigFile(lines);
    }
    
    private void createBackupIfNeeded() {
        if (Files.notExists(configFile)) {            
            return;
        }
        String backupFileName = configFile.getFileName().toString()+".install.bak";
        Path backupFile = configFile.getParent().resolve(backupFileName);
        if (Files.exists(backupFile)) {
            return;
        }
        try {
            Files.copy(configFile, backupFile, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
    
    private void saveConfigFile(List<String> lines) {
        StandardOpenOption openOption = Files.exists(configFile) ? StandardOpenOption.WRITE : StandardOpenOption.CREATE_NEW;
        write(lines, openOption);
    }

    private void write(List<String> lines, OpenOption openOption) {
        String content = lines.stream()
                              .collect(Collectors.joining(System.lineSeparator()));
        try {
            Files.writeString(configFile, content, openOption);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
    
    private void configureWith(String variableToFind, String expectedValue, List<String> lines) {
        String formatTemplate = "export %s=%s"; // (export variableName=variableValue)
        for (int i = 0; i < lines.size(); i++) {
            String line = lines.get(i);
            if (line.startsWith("export ")) {
                String[] configEntry = line.split("[=]");
                if (configEntry.length == 2 && ("export " +variableToFind).equalsIgnoreCase(configEntry[0])) {
                    if (!expectedValue.equals(configEntry[1])) {
                        lines.set(i, formatTemplate.formatted(variableToFind, expectedValue));
                        return;
                    }
                }    
            }
        }
        lines.add(0, formatTemplate.formatted(variableToFind, expectedValue));
    }
    
    private List<String> loadConfiguration() {
        if (Files.notExists(configFile)) {
            return new ArrayList<>();
        }
        try {
            return Files.readAllLines(configFile);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
    
    String adjustToGitPath(String variableValue) {
        return ("/"+variableValue).replace(":", "")
                                  .replace('\\', '/')
                                  .replace("//", "/");
    }
}
