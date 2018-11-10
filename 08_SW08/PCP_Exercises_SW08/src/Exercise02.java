import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Exercise02 {

    public void printNumbersAndSquares(Integer[] numbers) {
        List<Integer> list = Arrays.asList(numbers);
        list.forEach(i -> System.out.printf("%d: %d\n", i, i * i));
    }

    public static void main(String[] args) {
        Exercise02 ex = new Exercise02();
        Integer[] numbers = {1, 2, 3, 5, 8};
        ex.printNumbersAndSquares(numbers);

    }
}
