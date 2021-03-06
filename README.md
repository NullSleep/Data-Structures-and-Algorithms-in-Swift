# DATA STRUCTURES & ALGORITHMS IN SWIFT

## CHAPTER 1: PREFACE
The study of data structures is one of efficiency. Given a particular amount of data, what is the best to store it to achieve a particular goal?

> In most cases, there’s no need to derive a solution by yourself from first principles! Often, these problems have already been solved many times before by other people, and they have well-known solutions. The trick is to understand what sort of problem you’re dealing with — and that’s where learning about algorithms and data structures pays off. Once you know what a problem is called, it’s easy to find a solution for it.

Using an appropriate data structure is crucial when working with lots of data. Using the right algorithm plays a significant role in the performance and scalability of your software. Your mobile apps will be more responsive and have better battery life. Your server apps will be able to handle more concurrent requests and use less energy. Algorithms often include proofs of correctness that you can leverage to build better software.

The trick is to understand what sort of problem you’re dealing with... Once you know what a problem is called, it’s easy to find a solution for it.

## CHAPTER 2: SWIFT STANDARD LIBRARY

### Arrays
An array is a general-purpose, generic container for storing an ordered collection of elements.

Swift defines arrays using protocols. Each of these protocols layers more capabilities on the array. For example, an Array is a Sequence, which means that you can iterate through it at least once. It is also a Collection, which means it can be traversed multiple times, non-destructively, and it can be accessed using a subscript operator. An array is also a RandomAccessCollection, which makes guarantees about efficiency.

Random-access is a trait that data structures can claim if they can handle element retrieval in a constant amount of time. Getting an element from an array using it's subscript (i.e. array[2]) takes constant time. Again, this performance should not be taken for granted. Other data structures such as linked lists and trees do not have constant time access.

There are other areas of performance that are of interest to you as a developer, particularly, how well or poorly does the data structure fare when the amount of data it contains needs to grow? For arrays, this varies on two factors: Insertion and capacity.

The most efficient scenario for adding an element to an Arrays is to append it at the end of the array:

```
let people = ["Brian", "Stanley", "Ringo"]
people.append("Charles")

```

Inserting "Charles" using the append method will place the string at the end of the array. This is a constant-time operation, meaning the time it takes to perform this operation stays the same no matter how large the array becomes. However, there may come a time that you need to insert an element in a particular location, such as in the very middle of the array.

Inserting new elements from anywhere aside from the end of the array will force elements to shuffle backwards to make room for the new element:

```
people.insert("Andy", at: 0)
// ["Andy", "Brian", "Stanley", "Ringo", "Charles"]
```

To be precise, every element must shift backwards by one index, which takes n steps. If the number of elements in the array doubles, the time required for this insert operation will also double.

If inserting elements in front of a collection is a common operation for your program, you may want to consider a different data structure to hold your data.

The second factor that determines the speed of insertion is the array’s capacity. Underneath the hood, Swift arrays are allocated with a predetermined amount of space for its elements. If you try to add new elements to an array that is already at maximum capacity, the Array must restructure itself to make more room for more elements. This is done by copying all the current elements of the array in a new and bigger container in memory. However, this comes at a cost; Each element of the array has to be visited and copied.

This means that any insertion, even at the end, could take n steps to complete if a copy is made. However, the standard library employs a strategy that minimizes the times this copying needs to occur. Each time it runs out of storage and needs to copy, it doubles the capacity.

### Dictionaries
```
var score: [String: Int] = ["Eric": 9, "Mark": 7, "Pepe": 1]
```

Dictionaries don’t have any guarantees of order, nor can you insert at a specific index. They also put a requirement on the Key type that it be Hashable. Fortunately almost all of the standard types are already Hashable and in the most recent versions Swift, adopting the Hashable protocol is now trivial.

Dictionaries are unordered, so you can’t guarantee where new entries will be put. It is possible to traverse through the key-values of a dictionary multiple times as the Collection protocol affords. This order, while not defined, will be the same every time it is traversed until the collection is changed (mutated).

The lack of explicit ordering disadvantage comes with some redeeming traits. Unlike the array, dictionaries don’t need to worry about elements shifting around. Inserting into a dictionary always takes a constant amount of time. Lookup operations also take a constant amount of time, which is significantly faster than finding a particular element in an array which requires an walk from the beginning of the array to the insertion point.

### Key Points
- Every data structure have advantages and disadvantages. Knowing them is key to writing performant software.
- Functions such as insert(at:) for Array have performance characteristics that can cripple performance when used haphazardly. If you find yourself needing to use insert(at:) frequently with indices near the beginning of the array, you may want to consider a different data structure such as the linked list.
- Dictionary trades away the ability to maintain the order of its elements for fast insertion and searching.


## CHAPTER 3: COMPLEXITY

Will it scale?

This age-old question is always asked during the design phase of software development and comes in several flavors. For instance, from an architectural standpoint, scalability refers to how flexible your app is as your feature set increases. From a database standpoint, scalability is about the capability of a database to handle an increasing amount of data and users.

For algorithms, scalability refers to how the algorithm performs in terms of execution time and memory usage as the input size increases.

### Time Complexity
For small amounts of data, even the most expensive algorithm can seem fast due to the speed of modern hardware. However, as data increases, cost of an expensive algorithm becomes increasingly apparent. Time complexity is a measure of the time required to run an algorithm as the input size increases.

#### Constant time
A constant time algorithm is one that has the same running time regardless of the size of the input. The Big O notation for constant time is O(1).

#### Linear time
As the input array increases in size, the number of iterations that the for loop makes is increased by the same amount.

As the amount of data increases, the running time increases by the same amount. That's why you have the straight linear graph illustrated above. The Big O notation for linear time is O(n).

Time complexity only gives a high-level shape of the performance, so loops that happen a set number of times are not part of the calculation. All constants are dropped in the final Big O notation. In other words, O(2n + 6) is surprisingly equal to O(n).

#### Quadratic time
More commonly referred to as n squared, this time complexity refers to an algorithm that takes time proportional to the square of the input size.

The Big O notation for quadratic time is O(n^2).

No matter how inefficiently a linear time xO(n) is written (multiple passes etc), for a sufficiently large n, the linear time algorithm will execute faster than a super optimized quadratic algorithm. Always. Every time.

#### Logarithmic time
There are scenarios in which only a subset of the input needs to be inspected, leading to a faster runtime.

Algorithms that belong to this category of time complexity are ones that can leverage some shortcuts by making some assumptions about the input data

An algorithm that can repeatedly drop half of the required comparisons will have logarithmic time complexity. As input data increases, the time it takes to execute the algorithm increases at a slow rate.

The Big O notation for logarithmic time complexity is O(log n).

#### Quasilinear time
Another common time complexity you'll encounter is quasilinear time. Quasilinear time algorithms perform worse than linear time but dramatically better than quadratic time. They are among the most common algorithms you'll deal with. An example of a quasilinear time algorithm is Swift's sort method.

The Big-O notation for quasilinear time complexity is O(n log n) which is a multiplication of linear and logarithmic time. So quasilinear fits doesn't fit between logarithmic and linear time; it is a magnitude worse than linear time.

#### Other time complexities

Other time complexities do exist, but are far less common and tackle more complex problems that are not discussed in this book. These time complexities include polynomial time, exponential time, factorial time and more.

It is important to note that time complexity is a high-level overview of performance, and it doesn't judge the speed of the algorithm beyond the general ranking scheme. This means that two algorithms can have the same time complexity, but one may still be much faster than the other. For small data sets, time complexity may not be an accurate measure of actual speed.

#### Comparing time complexity

Suppose you wrote the following code that finds the sum of numbers from 1 to n.

```
func sumFromOne(upto n: Int) -> Int {
  var result = 0
  for i in 1...n {
    result += i
  }
  return result
}
sumFromOne(upto: 10000)
```

The code loops 10000 times and returns 50005000. It is O(n) and will take a moment to run in a playground as it counts through the loop and prints results.
You can write another version:

```
func sumForOne(upto n: Int) -> Int {
  return (1...n).reduce(0, +)
}
sumFromOne(upto: 10000)
```

In a playground this will run faster because it calls compiled code in standard library. However, if you look up the time complexity for reduce, you'll discover that it is also O(n) as it calls the + method n times. It is the same Big O, but has smaller constants because it is compiled code.

Finally, you can write:

```
func sumFromOne(upto n: Int) -> Int {
  return (n + 1) * n / 2
}
```

This version of the function uses a trick that the Fredrick Gauss noticed in elementary school. Namely, you can compute the sum using simple arithmetic. This final version of the algorithm is O(1) and tough to beat. A constant time algorithm is always preferred. If you put this version in a loop you still end up with linear time. The previous O(n) versions are just one outer loop away from slow, quadratic time.

### Space Complexity
The time complexity of an algorithm can help predict scalability, but it isn't the only metric. Space complexity is a measure of the resources required for the algorithm to run. For computers, the resources for algorithms is memory.

To calculate the space complexity, you analyze the memory allocations for the function.


## CHAPTER 4: LINKED LISTS
A linked list is a collection of values arranged in a linear unidirectional sequence. A linked list has several theoretical advantages over contiguous storage options such as the Swift Array:
- Constant time insertion and removal from the front of the list.
- Reliable performance characteristics.

[12] -> [1] -> [3] ->

As the diagram suggests, a linked list is a chain of nodes. Nodes have two responsibilities:
- Hold a value.
- Hold a reference to the next node. A nil value represents the end of the list.

A linked list has the concept of a head and tail, which refers to the first and last nodes of the list respectively.

### Adding Values
There are three ways to add values to a linked list, each having their own unique performance characteristics:
- push: Adds a value at the front of the list.
- append: Adds a value at the end of the list.
- insert(after:): Adds a value after a particular node of the list.

#### Push operation
Adding a value at the front of the list is known as a push operation. This is also known as head-first insertion.

#### Append operation
This is meant to add a value at the end of the list, and it is known as tail-end insertion.

#### Insert operation
The third and final operation for adding values is insert(after:). This operation inserts a value at a particular place in the list, and requires two steps:
1. Finding a particular node in the list.
2. Inserting the new node.

#### Performance analysis
- push -> insert at head -> time complexity: O(1)
- append -> insert at tail -> time complexity: O(1)
- insert(after:) -> insert after a node -> time complexity: O(1)
- node(at:) -> returns a node at given index -> time complexity: O(i) where i is the given index

### Removing Values
There are three main operations for removing nodes:
- pop: Removes the value at the front of the list.
- removeLast: Removes the value at the end of the list.
- remove(at:): Removes a value anywhere in the list.

#### Pop operation
Removing a value at the front of the list is often referred to as pop.

'pop' returns the value that was removed from the list. This value is optional, since it’s possible that the list is empty.

By moving the head down a node, you’ve effectively removed the first node of the list. ARC will remove the old node from memory once the method finishes, since there will be no more references attached to it. In the event that the list becomes empty, you set tail to nil.


#### Remove last operation
Removing the last node of the list is somewhat inconvenient. Although you have a reference to the tail node, you can’t chop it off without having a reference to the node before it. Thus, you’ll have to do an arduous traversal.

'removeLast' requires you to traverse all the way down the list. This makes for an O(n) operation, which is relatively expensive.

#### Remove after operation
The final remove operation is removing a particular node at a particular point in the list. This is achieved much like insert(after:); You’ll first find the node immediately before the node you wish to remove, and then unlink it.
