import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class RemoveFromGitBashEnvironment {
    public static void main(String[] args) {
        String operation = args[0];
        String variableName = args[1];
        Path bashrc = Path.of(System.getenv("USERPROFILE")).resolve(".bashrc");
        new RemoveFromGitBashEnvironment(bashrc).run(operation, variableName);
    }
       
    private final Path configFile;
    
    public RemoveFromGitBashEnvironment(Path bashrcFile) {
        this.configFile = bashrcFile;
    }
    
    private void run(String operation, String variableName) {
        if (Files.notExists(configFile))
            return;
        
        List<String> lines = loadConfiguration();
        Set<String> toBeRemoved = lines.stream()
                                    .filter(l->l.startsWith(operation+" "+variableName+"="))
                                    .collect(Collectors.toSet());
        
        if (toBeRemoved.isEmpty())
            return;
        
        List<String> newLines = lines.stream()
                                     .filter(l->!toBeRemoved.contains(l))
                                     .collect(Collectors.toList());
        
        createBackup();
        replaceOldFile(newLines);
    }
   
    private void createBackup() {
        String backupFileName = configFile.getFileName().toString()+".uninstall.bak";
        Path backupFile = configFile.getParent().resolve(backupFileName);
        try {
            Files.copy(configFile, backupFile, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
    
    private void replaceOldFile(List<String> newLines) {
        String content = newLines.stream()
                                 .collect(Collectors.joining("\n"));
        try {
            Files.deleteIfExists(configFile);
            Files.writeString(configFile, content, StandardOpenOption.CREATE_NEW);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    private List<String> loadConfiguration() {
        try {
            return Files.readAllLines(configFile);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
}
