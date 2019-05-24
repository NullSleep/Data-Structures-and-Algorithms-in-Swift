import Foundation

public struct LinkedList<Value> {
    
    // A linked list has the concept of head and tail which refers to the first and las nodes of the list respectively.
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    // Pushing into an empty list in which the new node is both head and tail of the list.
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        
        // If the list is empty update both head and tail to the new node. Since append on an empty list is functionally identical to push, you simply invoke push to do the work for you.
        guard !isEmpty else {
            push(value)
            return
        }
        
        // Since the list is not empty we are guaranteed the tail exists, so force unwrappiung is guaranteed to succeed. You simply create a new node after the tail node.
        tail!.next = Node(value: value)
        
        // Since this is tail-end insertion, your new node is also the tial fo the list.
        tail = tail!.next
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        
        return String(describing: head)
    }
}
