import Foundation

public struct LinkedList<Value> {
  
  // A linked list has the concept of a head and tail, which refers to the first and last nodes of the list respectively:
  
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  // Adding a value at the front of the list is known as a push operation. This is also known as head-first insertion.
  public mutating func push(_ value: Value) {
    // In the case in which you’re pushing into an empty list, the new node is both the head and tail of the list.
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  // Append operations. This is meant to add a value at the end of the list, and it is known as tail-end insertion.
  public mutating func append(_ value: Value) {
    // If the list is emoty, you'll need to update both head and tail to the new node. Since append on an empty list is functionally indentical to push, you simply invoke push to do the work.
    guard !isEmpty else {
      push(value)
      return
    }
    
    // In all other cases, you simply create a new node after the tail node. Force unwrapping is guaranteed to succed since you push in the isEmpty case with the above guard statement.
    tail!.next = Node(value: value)
    
    // Since this is tail-end insertion, your new node is also the tail of the list.
    tail = tail!.next
  }
  
}

extension LinkedList: CustomStringConvertible {
  
  public var description: String {
    guard let head = head else {
      return "Empty List"
    }
    return String(describing: head)
  }
}
