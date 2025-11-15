import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

class DinDonDan extends Thread {
    private final Semaphore P;

    private final String sound;
    private static String name;
    private final int time;

    public DinDonDan(Semaphore P, String sound, int time) {
        this.P = P;
        this.sound = sound;
        this.time = time;
    }

    @Override
    public void run() {
        try {
            P.acquire();

            for(int x = 1; x < time+1; x++) {
                System.out.print("["+x+"]" + sound + " ");
            
                name = Thread.currentThread().getName();
                System.out.println("[+] Executing: " + name);
            }
        } catch(InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            P.release();
        }
    }
    
}

// Priority System
class DinDonDanReal extends Thread {
    private final AtomicInteger T;
    private final int t;

    private final String sound;
    private static String name;
    private final int time;

    public DinDonDanReal(AtomicInteger T, int t, String sound, int time) {
        this.T = T;
        this.t = t;
        this.sound = sound;
        this.time = time;
    }

    @Override
    public void run() {
        try {
            for (int x = 1; x < time + 1; x++) {
                while (T.get()%3 != t) { }
                System.out.print("[" + x + "]" + sound + " ");
                
                name = Thread.currentThread().getName();
                System.out.println("[+] Executing: " + name);
                
                T.incrementAndGet();
            }
        } finally {
            Thread.currentThread().interrupt();
        }
    }
}

class PingPong extends Thread {
    private final String action;

    public PingPong(String action) {
        this.action = action;
    }

    @Override 
    public void run() {
        for(int x = 0; x < 5; x ++) {
            System.out.println("["+x+"] " + this.action + " [+] Executing: "+ Thread.currentThread().getName());
            Thread.yield();
        }
    } 
}

class PingPongReal extends Thread {
    private final AtomicInteger T;
    private final int t;

    private final String action;
    private static String name;
    private final int time;

    public PingPongReal(AtomicInteger T, int t, String action, int time) {
        this.T = T;
        this.t = t;
        this.action = action;
        this.time = time;
    }

    @Override
    public void run() {
        try {
            for(int x = 0; x < time; x++) {
                while(T.get()%3 != t) { }

                System.out.print("[" + x + "]" + action + " ");
                
                name = Thread.currentThread().getName();
                System.out.println("[+] Executing: " + name);
                
                T.set( (T.get()+1) % 2);
            }    
        } finally {
            Thread.currentThread().interrupt();
        }
    }
}

public class Main {

    public static void main(String [] kwargs) {
        Semaphore P = new Semaphore(1);

        Thread F = new DinDonDan(P, "din", 5);
        Thread S = new DinDonDan(P, "don", 5);
        Thread T = new DinDonDan(P, "dan", 5);

        F.setName("F-din");
        S.setName("S-don");
        T.setName("T-dan");

        F.start();
        S.start();
        T.start();

        while (F.isAlive() || S.isAlive() || T.isAlive()) { }
        
        System.out.println("\n");
        
        AtomicInteger Turn = new AtomicInteger(0);

        Thread T_4 = new DinDonDanReal(Turn, 0, "din", 5);
        Thread T_5 = new DinDonDanReal(Turn, 1, "don", 5);
        Thread T_6 = new DinDonDanReal(Turn, 2,"dan", 5);

        T_4.setName("T_4-din");
        T_5.setName("T_5-din");
        T_6.setName("T_6-din");
        
        T_4.start();
        T_5.start();
        T_6.start();
        
        while (T_4.isAlive() || T_5.isAlive() || T_6.isAlive()) { }

        System.out.println("\n");

        Thread T_7 = new PingPong("Ping");
        Thread T_8 = new PingPong("Pong");

        T_7.setName("T_7-Ping");
        T_8.setName("T_8-Pong");

        T_7.start();
        T_8.start();

        while (T_7.isAlive() || T_8.isAlive() ) { }

        System.out.println("\n");
            
        Turn.set(0);
        
        Thread T_9 = new PingPongReal(Turn, 0, "ping", 5);
        Thread T_10 = new PingPongReal(Turn, 1, "pong", 5);

        T_9.setName("T_9-Ping");
        T_10.setName("T_10-Pong");

        T_9.start();
        T_10.start();
    }
}