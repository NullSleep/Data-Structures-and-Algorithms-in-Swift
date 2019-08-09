import Foundation

public struct LinkedList<Value> {
  
  // A linked list has the concept of a head and tail, which refers to the first and last nodes of the list respectively:
  
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    return head = nil
  }
  
  // Adding a value at the front of the list is known as a push operation. This is also known as head-first insertion.
  public mutating func push(_ value: Value) {
    // In the case in which you’re pushing into an empty list, the new node is both the head and tail of the list.
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
}

extension LinkedList: CustomStringConvertible {
  
  public var description: String {
    guard let head = head else {
      return "Empty List"
    }
  }
  return String(describing: head)
}
