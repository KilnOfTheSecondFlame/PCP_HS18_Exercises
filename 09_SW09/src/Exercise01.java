import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class Exercise01 {

    public static void main(String[] args) {
        String[] namesArray = {"Joe", "Tara", "Sue", "Tim" };
        Optional<String> x = Exercise01.reduceAndPrintStrings(namesArray);
        x.ifPresent(name -> System.out.println("[Debugoutput] x = " + name));
        Exercise01.printOptional(x, "[Default]");
        Optional<String> y = Exercise01.reduceAndPrintStrings(new String[0]);
        Exercise01.printOptional(y, "[Default]");
    }

    public static Optional<String> reduceAndPrintStrings(String[] namesArray) {
        List<String> names = Arrays.asList(namesArray);
        Optional<String> x = names
                .stream()
                .filter(s -> s.startsWith("T"))
                .map(s -> s.toUpperCase())
                .reduce((s, t) -> s + " " + t);
        return x;
    }

    public static void printOptional(Optional<String> optionalString, String defaultValue) {

        System.out.println("Value = " + optionalString.orElse(defaultValue));
    }
}
