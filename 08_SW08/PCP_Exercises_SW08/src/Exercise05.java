import java.util.stream.IntStream;

public class Exercise05 {
    public static void main(String[] args) {
        IntStream
                .iterate(0, i -> i + 1)
                .limit(100)
                .forEach(i -> System.out.printf("%d, ", i));

        System.out.println();
        IntStream
                .iterate(0, i -> i + 1)
                .parallel()
                .limit(100)
                .forEach(i -> System.out.printf("%d, ", i));
    }
}
