import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class UpdateGradleProperties {
    
    public static void main(String[] args) throws IOException {
        Path gradleProperties = Path.of(System.getenv("USERPROFILE"))
                                    .resolve(".gradle")
                                    .resolve("gradle.properties");
        
        new UpdateGradleProperties(gradleProperties).run();
    }
    
    private final Path propertiesFile;
    
    UpdateGradleProperties(Path gradleProperties) {
        this.propertiesFile = Objects.requireNonNull(gradleProperties);
    }   
   
    private void run() throws IOException {       
        List<String> lines = readGradleProperties();
        configureWith("systemProp.javax.net.ssl.trustStore", "C:\\\\Windows\\\\win.ini", lines);
        configureWith("systemProp.javax.net.ssl.trustStoreType", "Windows-ROOT", lines);
        createBackupIfNeeded();
        saveGradleProperties(lines);
    }

    private void createBackupIfNeeded() {
        if (Files.notExists(propertiesFile)) {            
            return;
        }
        String backupFileName = propertiesFile.getFileName().toString()+".bak";
        Path backupFile = propertiesFile.getParent().resolve(backupFileName);
        try {
            Files.copy(propertiesFile, backupFile, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    private void saveGradleProperties(List<String> lines) {
        StandardOpenOption openOption = Files.exists(propertiesFile) ? StandardOpenOption.WRITE : StandardOpenOption.CREATE_NEW;
        write(lines, openOption);
    }

    private List<String> readGradleProperties() {
        if (Files.notExists(propertiesFile))
            return new ArrayList<>();
        try {
            return Files.readAllLines(propertiesFile);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    private void write(List<String> lines, OpenOption openOption)  {
        String content = lines.stream()
                              .collect(Collectors.joining(System.lineSeparator()));
        try {
            Files.createDirectories(propertiesFile.getParent());
            Files.writeString(propertiesFile, content, openOption);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    private void configureWith(String propertyToFind, String expectedValue, List<String> lines) {
        for (int i = 0; i < lines.size(); i++) {
            String line = lines.get(i);
            String[] configEntry = line.split("[=]");
            if (configEntry.length == 2 && propertyToFind.equalsIgnoreCase(configEntry[0])) {
                if (!expectedValue.equals(configEntry[1])) {
                    lines.set(i, "%n# Modified by Java-Toolkit: %s%n%s=%s".formatted(line, propertyToFind, expectedValue));
                }
            }
        }
    }
    
}
