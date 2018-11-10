import java.util.Arrays;
import java.util.function.Predicate;

public class Exercise04 {

    public static boolean lengthBetweenThreeAndFour(String s) {
        return s.length() >= 3 && s.length() <= 4;

    }

    public String processNames(String[] names) {
        Predicate<String> nameLengthPredicate = Exercise04::lengthBetweenThreeAndFour;
        return Arrays.stream(names)
                .map(String::toUpperCase)
                .filter(nameLengthPredicate)
                .reduce("", (previous, actual) -> (previous != "") ? previous + " " + actual : actual);

    }

    public static void main(String[] args) {
        Exercise04 ex = new Exercise04();
        String[] names = {"Susanna", "Joe", "Lu", "Timmy", "Rafael", "Lisa"};
        System.out.println(ex.processNames(names));

    }


}
