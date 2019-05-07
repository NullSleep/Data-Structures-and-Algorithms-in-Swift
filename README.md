# DATA STRUCTURES & ALGORITHMS IN SWIFT BOOK

## CHAPTER 1
The study of data structures is one of efficiency. Given a particular amount of data, what is the best to store it to achieve a particular goal?

## CHAPTER 2

The study of data structures is one of efficiency. Given a particular amount of data, what is the best way to store it to achieve a particular goal?

### Arrays
The most efficient for  adding an element to an Arrays is to append it at the end of the array:

```
let people = ["Brian", "Stanley", "Ringo"]
people.append("Charles")

```

Inserting "Charles" using the append method will place the string at the end of the array. This is a constant-time operation, meaning the time it takes to perform this operation stays the same no matter how large the array becomes. However, there may come a time that you need to insert an element in a particular location, such as in the very middle of the array.

This is exactly how the array works. Inserting new elements from anywhere aside from the end of the array will force elements to shuffle backwards to make room for the new element:

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


## CHAPTER 3

Will it scale?

This age-old question is always asked during the design phase of software development and comes in several flavors. For instance, from an architectural standpoint, scalability refers to how flexible your app is as your feature set increases. From a database standpoint, scalability is about the capability of a database to handle an increasing amount of data and users.

For algorithms, scalability refers to how the algorithm performs in terms of execution time and memory usage as the input size increases.
When you're working with a small amount of data, an expensive algorithm may still feel fast. However, as the amount of data increases, an expensive algorithm becomes crippling. So how bad can it get? Understanding how to quantify this is an important skill for you to know.
