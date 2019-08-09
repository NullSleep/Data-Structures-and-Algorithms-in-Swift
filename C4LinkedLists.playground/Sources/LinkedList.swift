import Foundation

public struct LinkedList<Value> {
  
  // A linked list has the concept of a head and tail, which refers to the first and last nodes of the list respectively:
  
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    return head = nil
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
