import Foundation

public struct LinkedList<Value> {
  
  // A linked list has the concept of a head and tail, which refers to the first and last nodes of the list respectively:
  
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    return head == nil
  }
}

// MARK: - Adding Values
extension LinkedList {
  // PUSH
  // Adding a value at the front of the list is known as a push operation. This is also known as head-first insertion.
  public mutating func push(_ value: Value) {
    // In the case in which you’re pushing into an empty list, the new node is both the head and tail of the list.
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  // APPENDING
  // Append operation. This is meant to add a value at the end of the list, and it is known as tail-end insertion.
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
  
  // INSERT
  // “This operation inserts a value at a particular place in the list, and requires two steps: Finding a particular node in the list; Inserting the new node.
  
  // First, you’ll implement the code to find the node where you want to insert your value. This function will try to retrieve a node in the list based on the given index. Since you can only access the nodes of the list from the head node, you’ll have to make iterative traversals.
  public func node(at index: Int) -> Node<Value>? {
    
    // You create a new reference to head and keep track of the current number of traversals.
    var currentNode = head
    var currentIndex = 0
    
    // Using a while loop, you move the reference down the list until you’ve reached the desired index. Empty lists or out-of-bounds indexes will result in a nil return value.
    while currentNode != nil && currentIndex < index {
      currentNode = currentNode!.next
      currentIndex += 1
    }
    
    return currentNode
  }
  
  // Now inserting the new node
  
  // @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
  @discardableResult public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
    
    // In the case where this method is called with the tail node, you’ll call the functionally equivalent append method. This will take care of updating tail.
    guard tail !== node else {
      append(value)
      return tail!
    }
    
    // Otherwise, you simply link up the new node with the rest of the list and return the new node.
    node.next = Node(value: value, next: node.next)
    
    return node.next!
  }
}

// MARK: - Removing Operations
extension LinkedList {
  
  // POP
  // Removing a value at the front of the list is often referred to as pop. This function returns the value that was removed from the list. This value is optional, since it's possible that the list is empty.
  @discardableResult public mutating func pop() -> Value? {
    defer {
      // By moving the head down a node, you’ve effectively removed the first node of the list. ARC will remove the old node from memory once the method finishes, since there will be no more references attached to it. In the event that the list becomes empty, you set tail to nil.
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    return head?.value
  }
  
  
  discardableResult
  public mutating func removeLast() -> Value? {
    // 1
    guard let head = head else {
      return nil
    }
    // 2
    guard head.next != nil else {
      return pop()
    }
    // 3
    var prev = head
    var current = head
    
    while let next = current.next {
      prev = current
      current = next
    }
    // 4
    prev.next = nil
    tail = prev
    return current.value
  }
}

// MARK: - Extending LinkedList to conform to CustomStringConvertible
extension LinkedList: CustomStringConvertible {
  
  public var description: String {
    guard let head = head else {
      return "Empty List"
    }
    return String(describing: head)
  }
}
