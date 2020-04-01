package ru.kpfu.itis.group907.lapin.algorithms.pair1;

public class LinkedList {
    public Node head;

    LinkedList( Node head ) {
        this.head = head;
    }

    public String toString() {
        String string = "";
        Node node = this.head;
        while (node != null) {
            string = string + "" + node;
            node = node.next;
        }
        return string;
    }

    public int len() {
        Node node = this.head;
        int len = 1;
        while (node != null) {
            node = node.next;
            len++;
        }
        return len;
    }


    public void add( Node input ) {
        Node node = this.head;
        while (true) {
            if (node.next == null) {
                node.next = input;
                break;
            }
            node = node.next;
        }
    }

    public int max() {
        int max = 0;
        Node node = this.head;
        while (true) {
            if (node.number > max) {
                max = node.number;
            }
            if (node.next == null) {
                break;
            }
            node = node.next;
        }
        return max;
    }

    public int sum() {
        int sum = 0;
        Node node = this.head;
        while (node.next != null) {
            sum += node.number;
            node = node.next;
        }
        return sum;
    }


    public boolean hasNegative() {
        boolean b = true;
        Node node = this.head;
        while (node.next != null) {
            if (node.number < 0) {
                b = false;
                break;
            }
            node = node.next;
        }
        return b;
    }

    public void removeHead() {
        this.head = this.head.next;
    }

    public void removeTail() {
        Node node = this.head;
        while (true) {
            if (node.next.next == null) {
                node.next = null;
                break;
            }
            node = node.next;
        }
    }


    public void removeNode( Node input ) {
        Node node = this.head;
        while (true) {
            if (node.next.next == input.next) {
                node.next = node.next.next;
                break;
            }
            node = node.next;
        }
    }


    public void removeА( int index ) {
        Node node = this.head;
        while (true) {
            if (node.next.next == get( index ).next) {
                node.next = node.next.next;
                break;
            }
            node = node.next;
        }
    }

    public Node get( int index ) {
        if (index > this.len()) {
            throw new IllegalArgumentException( " Dude I think you're out of the Linked list" );
        } else if (index == 0) {
            return this.head;
        } else {
            Node node = this.head;
            for ( int i = 1; i <= index; i++ ) {
                node = node.next;
            }
            return node;
        }
    }
}
//всё что было в моих силах