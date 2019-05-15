# DATA STRUCTURES & ALGORITHMS IN SWIFT

## CHAPTER 1: PREFACE
The study of data structures is one of efficiency. Given a particular amount of data, what is the best to store it to achieve a particular goal?

The trick is to understand what sort of problem you’re dealing with... Once you know what a problem is called, it’s easy to find a solution for it.

## CHAPTER 2: SWIFT STANDARD LIBRARY

### Arrays
Swift defines arrays using protocols. Each of these protocols layers more capabilities on the array. For example, an Array is a Sequence, which means that you can iterate through it at least once. It is also a Collection, which means it can be traversed multiple times, non-destructively, and it can be accessed using a subscript operator. An array is also a RandomAccessCollection, which makes guarantees about efficiency.

The most efficient scenario for  adding an element to an Arrays is to append it at the end of the array:

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
