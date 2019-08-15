import Foundation

public func example(of description: String, action: () -> Void) {
  print("-- Example of \(description) --")
  action()
  print("\n")
}

public func createDescendingLinkedList() -> LinkedList<Int> {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  return list
}
