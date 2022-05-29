import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;

public class UpdateGradleJavaHome {

    public static void main(String[] args) {
        if (args.length != 2) {
            throw new IllegalArgumentException("There is exactly one argument required, the Gradle install location and the desired Java Home location.");
        }
        
        if (args[0].isBlank() || args[0].isBlank()) {
            throw new IllegalArgumentException("Both, the Gradle install location and the desired JAVA_HOME location must not be blank.");
        }
        
        String gradleInstallDir = args[0];
        String javaHomeDir = args[1];
        new UpdateGradleJavaHome(Path.of(gradleInstallDir)).run(javaHomeDir);
    }
    
    private final Path gradleDir;
    
    public UpdateGradleJavaHome(Path gradleInstallDir) {
        this.gradleDir = gradleInstallDir;
    }
    
    private void run(String javaHomeDir) {
        updateGradleBat(javaHomeDir);
        updateGradleForBash(javaHomeDir);
    }

    private void updateGradleBat(String javaHomeDir) {
        Path gradleBat = gradleDir.resolve("bin").resolve("gradle.bat");
        String script = readScript(gradleBat);
        String updated = """
                @ECHO OFF
                @SET JAVA_HOME=%s
                """.formatted(javaHomeDir).concat(script);
        
        createBackup(gradleBat, ".bak.bat");
        writeScript(updated, gradleBat);        
    }
    
    private void updateGradleForBash(String javaHomeDir) {
        Path gradle_sh = gradleDir.resolve("bin").resolve("gradle");
        String script = readScript(gradle_sh);
        String newJavaHomeDir = adjustToGitPath(javaHomeDir);
        String export = "#!/bin/sh\nexport JAVA_HOME=%s\n".formatted(newJavaHomeDir);
        String updated = script.replace("#!/bin/sh", export).replace("\r\n", "\n");
        createBackup(gradle_sh, "_bak");
        writeScript(updated, gradle_sh);
    }

    private void createBackup(Path gradleBat, String ext) {
        String backupFileName = gradleBat.getFileName().toString().replace(".bat", "")+ext;
        Path backupFile = gradleBat.getParent().resolve(backupFileName);
        try {
            Files.copy(gradleBat, backupFile, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    private void writeScript(String newScript, Path gradleBat) {
        try {
            Files.deleteIfExists(gradleBat);
            Files.writeString(gradleBat, newScript, StandardOpenOption.CREATE_NEW);
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    private String readScript(Path gradleBat) {
        try {
            return Files.readString(gradleBat);
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
