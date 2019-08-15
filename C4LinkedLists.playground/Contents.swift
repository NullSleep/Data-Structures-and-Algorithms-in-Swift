import UIKit

// A linked list is a collection of values arranged in a linear unidirectional sequence. A linked list has several theoretical advantages over contiguous storage options such as the Swift Array: Constant time insertion and removel from the front of the list; Reliable performance characteristics.

// NODES

example(of: "Creating and linking nodes") {
  let node1 = Node(value: 1)
  let node2 = Node(value: 2)
  let node3 = Node(value: 3)
  
  node1.next = node2
  node2.next = node3
  
  print(node1)
}

// LINKED LIST ADD OPERATIONS

example(of: "LinkedList: push") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print(list)
}

example(of: "LinkedList: append") {
  var list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  
  print(list)
}

example(of: "LinkedList: inserting at a particular index") {
  var list = createDescendingLinkedList()
  print("Before inserting: \(list)")
  
  var middleNode = list.node(at: 1)!
  for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}

// LINKED LIST REMOVE OPERATIONS

example(of: "LinkedList: pop") {
  var list = createDescendingLinkedList()
  print("Before popping list: \(list)")
  
  let poppedValue = list.pop()
  print("After popping list: \(list)")
  print("Popped value: " + String(describing: poppedValue))
}

example(of: "LinkedList: removing the last node") {
  var list = createDescendingLinkedList()
  print("Before removing the last node: \(list)")
  
  let removedValue = list.removeLast()
  print("After removing last node: \(list)")
  
  print("After removing the last node: \(list)")
  print("Removed value: " + String(describing: removedValue))
}

example(of: "LinkedList: remove a node after a particular node") {
  var list = createDescendingLinkedList()
  print("Before removing at a particular index: \(list)")
  
  let index = 1
  let node = list.node(at: index - 1)!
  let removedValue = list.remove(after: node)
  
  print("After removing at indecx \(index): \(list)")
  print("Removed value: " + String(describing: removedValue))
}
