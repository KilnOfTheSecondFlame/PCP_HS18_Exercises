public class Exercise03 {

    public static void main(String[] args) {
        TripleIntOperator tio = (int x,int y,int z) -> x + y + z;
        System.out.println(tio.sum(1,2,3));

    }
}
