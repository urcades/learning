/*
 Mutability of Collections
*/

// If you create an array, a set, or a dictionary, and assign it to a variable, the collection that’s created will be mutable.
var someInts: [Int] = []
print("SomeInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
print("After appending, SomeInts is of type [Int] with \(someInts.count) items.")
someInts = []
print("After reassigning, SomeInts is of type [Int] with \(someInts.count) items.")

// Swift’s Array type also provides an initializer for creating an array of a certain size with all of its values set to the same default value.
var threeDoubles = Array(repeating: 0.0, count: 10)
print(threeDoubles)

// You can create a new array by adding together two existing arrays with compatible types with the addition operator (+).
var anotherThreeDoubles = Array(repeating: 5.5, count: 10)
print(anotherThreeDoubles)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

// You can also initialize an array with an array literal, which is a shorthand way to write one or more values as an array collection.
// An array literal is written as a list of values, separated by commas, surrounded by a pair of square brackets:
var shoppingList = ["Eggs", "Milk"]
print(shoppingList)

// Accessing and Modifying an Array 
// You access and modify an array through its methods and properties, or by using subscript syntax.
print("The shopping list contains \(shoppingList.count) items.")

// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

// You can add a new item to the end of an array by calling the array’s append(_:) method:
shoppingList.append("Flour")
print(shoppingList)
print("The shopping list contains \(shoppingList.count) items.")

// Alternatively, append an array of one or more compatible items with the addition assignment operator (+=):
shoppingList += ["Baking Powder"]
print(shoppingList)
print("The shopping list contains \(shoppingList.count) items.")

shoppingList += ["Chocolate Nuggets", "Cheese", "Butter"]
print(shoppingList)
print("The shopping list contains \(shoppingList.count) items.")

// Retrieve a value from the array by using subscript syntax, 
// passing the index of the value you want to retrieve within square brackets immediately after the name of the array:
var firstItem = shoppingList[0]
print(firstItem)

// You can use subscript syntax to change an existing value at a given index:
shoppingList[0] = "Jelly"
print(shoppingList)

// You can also use subscript syntax to change a range of values at once, 
// even if the replacement set of values has a different length than the range you are replacing.
shoppingList[4...6] = ["Bannanas", "Apples"]

// You can also use subscript syntax to change a range of values at once, 
// even if the replacement set of values has a different length than the range you are replacing.
shoppingList.insert("Whatever", at: 0)
print(shoppingList)

// Similarly, you remove an item from the array with the remove(at:) method.
// This method removes the item at the specified index and returns the removed item
let what = shoppingList.remove(at: 0)
print(what)

// If you want to remove the final item from an array, 
// use the removeLast() method rather than the remove(at:) method to avoid the need to query the array’s count property. 
let apples = shoppingList.removeLast()
print(apples)

// You can iterate over the entire set of values in an array with the for-in loop:
for item in shoppingList {
    print("- \(item)")
}

// If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead.
for (index, value) in shoppingList.enumerated() {
    print("\(index + 1). \(value)")
}


/*
 Sets
*/

// A set stores distinct values of the same type in a collection with no defined ordering. 
// You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once.
// A type must be hashable in order to be stored in a set — that is, the type must provide a way to compute a hash value for itself.
// The type of a Swift set is written as Set<Element>, where Element is the type that the set is allowed to store. 
// Unlike arrays, sets don’t have an equivalent shorthand form.

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")

// Creating a set with an array literal

// You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set collection.
var favoriteGenres: Set = ["Rock", "Classical", "Hip Hop"]
print(favoriteGenres)

// Accessing and modifying a Set

// You access and modify a set through its methods and properties.
// To find out the number of items in a set, check its read-only count property:
print("I have \(favoriteGenres.count) favorite movie genres.")
// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// You can add a new item into a set by calling the set’s insert(_:) method:
favoriteGenres.insert("Jazz")
// You can remove an item from a set by calling the set’s remove(_:) method, which removes the item 
// if it’s a member of the set, and returns the removed value, or returns nil if the set didn’t contain it.
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Alternatively, all items in a set can be removed with its removeAll() method.
// To check whether a set contains a particular item, use the contains(_:) method:
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// Iterating over a Set

// You can iterate over the values in a set with a for-in loop.
// Swift’s Set type doesn’t have a defined ordering. To iterate over the values of a set in a specific order, 
// use the sorted() method, which returns the set’s elements as an array sorted using the < operator.
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// Performing Set Operations

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

// Set membership and equality

// Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
// Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
// Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
// Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
// Use the isDisjoint(with:) method to determine whether two sets have no values in common.

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))


/*
 Dictionaries
*/

// A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering.
// Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.
// Unlike items in an array, items in a dictionary don’t have a specified order. You use a dictionary when you need to look up values based on their identifier,
// in much the same way that a real-world dictionary is used to look up the definition for a particular word.

// The type of a Swift dictionary is written in full as Dictionary<Key, Value>
// A dictionary Key type must conform to the Hashable protocol, like a set’s value type.

// As with arrays, you can create an empty Dictionary of a certain type by using initializer syntax:
var namesOfIntegers: [Int: String] = [:]
print(type(of: namesOfIntegers))

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]

// Creating a dictionary with a dictionary literal

// A dictionary literal is a shorthand way to write one or more key-value pairs as a Dictionary collection.
// A key-value pair is a combination of a key and a value.
// The key-value pairs are written as a list, separated by commas, surrounded by a pair of square brackets:
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// As with arrays, you don’t have to write the type of the dictionary if you’re 
// initializing it with a dictionary literal whose keys and values have consistent types:
var airportsTerser = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// Accessing and Modifying a Dictionary

// You access and modify a dictionary through its methods and properties, or by using subscript syntax.
// As with an array, you find out the number of items in a Dictionary by checking its read-only count property:
print("The airports dictionary contains \(airports.count) items.")
// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if airports.isEmpty {
    print("The airporots dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}
// You can add a new item to a dictionary with subscript syntax.
// Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type:
airports["LHR"] = "London"
// You can also use subscript syntax to change the value associated with a particular key:
airports["LHR"] = "London Heathrow"
// As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or update the value for a particular key.
// Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update.
// The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type.
// This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// You can also use subscript syntax to retrieve a value from the dictionary for a particular key. 
// Because it’s possible to request a key for which no value exists
// a dictionary’s subscript returns an optional value of the dictionary’s value type.
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}
// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key:
airports["APL"] = "Apple International"
airports["APL"] = nil
// Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method. 
// This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed:
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

// Iterating over a Dictionary

// You can iterate over the key-value pairs in a dictionary with a for-in loop.
// Each item in the dictionary is returned as a (key, value) tuple,
//  and you can decompose the tuple’s members into temporary constants or variables as part of the iteration:
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)
print(airportCodes)
let airportNames = [String](airports.values)
print(airportNames)