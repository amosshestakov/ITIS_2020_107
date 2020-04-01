package ru.kpfu.itis.group907.lapin.algorithms.pair1;

public class Node {
    public Node next;
    public int number;

    Node(int elem, Node node){
        this.number = elem;
        this.next = node;
    }

    @Override
    public String toString(){
        return this.number + " ";
    }
}
