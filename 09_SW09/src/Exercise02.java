import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class Exercise02 {
    public static void genereateSortAndPrintRandomInts(int numberOfVals, int maxValueExc){
        List<Integer> list = new Random().ints(0, maxValueExc)
                .limit(numberOfVals)
                .boxed()
                .collect(Collectors.toList());
        list.sort(Comparator.reverseOrder());
        String output = list.stream()
                .map(i -> i.toString())
                .collect(Collectors.joining(" > ", "{ ", " }"));
        System.out.println("reverse ordered list = " + output);
    }

    public static void main(String[] args) {
        Exercise02.genereateSortAndPrintRandomInts(7, 100);
    }
}
