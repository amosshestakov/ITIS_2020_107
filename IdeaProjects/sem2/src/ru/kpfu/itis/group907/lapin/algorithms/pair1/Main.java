package ru.kpfu.itis.group907.lapin.algorithms.pair1;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Input Linked list length ");
        int counter = in.nextInt() - 1;

        System.out.println("Input First node amount");
        int FirstNode = in.nextInt();
        LinkedList linkedList = new LinkedList(new Node(FirstNode, null));

        for (int i = 1; i <= counter; i++) {
            System.out.println("Input " + i + " node element ");
            Node node = new Node(in.nextInt(), null);
            linkedList.add(node);
        }
        Node node1 = linkedList.head;
        Node node2 = node1;
        for (int i = 0; i <= counter; i++) {
            node1 = node1.next;
            node2 = node1;
        }


    }
}
