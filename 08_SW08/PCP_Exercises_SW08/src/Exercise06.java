import java.util.Random;
import java.util.stream.IntStream;
import java.util.concurrent.atomic.AtomicInteger;

public class Exercise06 {

    public static void main(String[] args) {
        AtomicInteger index = new AtomicInteger();

        boolean result = new Random().ints()
                .peek(i -> index.getAndIncrement())
                .anyMatch(i -> (i > 10000 && i < 12000));
        System.out.println("Found suitable number at stream position " + index.get());
    }
}
