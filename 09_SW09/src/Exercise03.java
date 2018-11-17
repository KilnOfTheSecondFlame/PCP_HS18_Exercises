import java.util.concurrent.CompletableFuture;

public class Exercise03 {
    public static void doBlockingWait(long waitingTimeMillis) {
        try {
            Thread.sleep(waitingTimeMillis);
        } catch (InterruptedException ie) {
            // nop.
        }
    }

    public static void main(String[] args) {
        final CompletableFuture<Long> longLastingTaskFuture = CompletableFuture.supplyAsync(() -> {
            Exercise03.doBlockingWait(3000);
            System.out.print(3000);
            return 3000L;
        });
        final CompletableFuture<Long> evenLongerLastingTaskFuture = CompletableFuture.supplyAsync(() -> {
            Exercise03.doBlockingWait(6000);
            System.out.print(6000);
            return 6000L;
        });
        CompletableFuture<String> lastTaskFuture = longLastingTaskFuture
                .thenCombineAsync(evenLongerLastingTaskFuture, (s, t) -> {
                    Exercise03.doBlockingWait(2000);
                    return "was waiting for " + (s+t+2000) + "ms";
                });
        lastTaskFuture.thenAccept(System.out::println);
        System.out.println("-> Now waiting for things to happen!");
        for (int i = 0; i < 20; i++) {
            System.out.print(".");
            doBlockingWait(500);
        }
        System.out.println();
        System.out.println("-> Done.");
    }
}
