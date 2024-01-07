//
// Arrays
//

// Arrays are a data type like String, Int, and Double, but they are used to hold
// MULTIPLE values under ONE variable or constant. Arrays are also known as a collection type
// Arrays can hold as many values as needed, and can automatically adapt to hold more:
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]
// These are three different arrays:
// one holding strings, one holding integers, and one holding doubles

// Reading out values from an array requires reading the position of an element:
print(beatles[0])
print(numbers[1])
print(temperatures[2])

// If your array is variable, you can modify it after creating it by using "append()"
beatles.append("Adrian")
print(beatles)
// Appended values must conform to the single type already held in the array:
// temperatures.append("Chris")
// (the value above cannot be used, since it's not a Double)

// Initializing an array without items requires explicit type annotation
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores)
print(scores[1])

// Arrays are so common in Swift that there’s a special way to create them rather than writing Array<String>:
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

// Like the other types we've covered, Arrays have special functions associated with them:
// You can use .count to read how many items are in an array, just like you did with strings:
print(albums.count)
// You can remove items from an array by using either
// remove(at:) to remove one item at a specific index, or
// removeAll() to remove everything:
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
// This method is special because it additionally returns the item that's being removed
print(characters.count)

characters.removeAll()
print(characters.count)

// You can check whether an array contains a particular item by using contains(), like this:
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

// You can sort an array using sorted(), like this:
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())
// This returns a new array with its items sorted in ascending order,
// which means alphabetically for strings but numerically for numbers

// Finally, you can reverse an array by calling reversed() on it:
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


//
// Dictionaries
//

// Arrays are a great choice when items should be stored in the order you add them,
// or when you might have duplicate items in there,
// but very often accessing data by its position in the array can be annoying or even dangerous.
var employee = ["Taylor Swift", "Singer", "Nashville"]
//  The data is about an employee, so you might be able to guess what various parts do:
print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")
// This array has problems when it comes to reading out indices of the array, which are ambiguous and can
// change as other elements are added or removed from the array:
print("Name: \(employee[0])")
employee.remove(at: 1)
print("Job title: \(employee[1])")
// Accessing index [2] would simply error out, since it no longer exists.

// Dictionaries don’t store items according to their position like arrays do,
// but instead let us decide where items should be stored.
// We could rewrite our previous example to be more explicit about what each item is:
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
// Swift calls the strings on the left – name, job, and location – the keys to the dictionary,
// and the strings on the right are the values.

// When it comes to reading data out from the dictionary, you use the same keys you used when creating it:
print(employee2["name"])
print(employee2["job"])
print(employee2["location"])
// Each of these are returned as optional values, because values might not exist for particular keys
// Here's an example of keys with no value:
print(employee2["password"])
print(employee2["status"])
print(employee2["manager"])

// Providing a default value for a given key ensures that a value is always present
// Which results in a value that is no longer "optional" (potentially nil)
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// Each of the examples of dictionaries above use pairs of Strings as key/values, but any type can be used:
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]
print(hasGraduated["Otis", default: false])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])

// You can also create an empty dictionary using
// whatever explicit types you want to store, then set keys one by one:
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

// Because each dictionary item must exist at one specific key,
// dictionaries don’t allow duplicate keys to exist.
// Instead, if you set a value for a key that already exists,
// Swift will overwrite whatever was the previous value:
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies)

archEnemies["Batman"] = "Penguin"
print(archEnemies)

// Finally, just like arrays and the other data types we’ve seen so far,
// dictionaries come with some useful functionality that you’ll want to use in the future:
print(archEnemies.count, terminator: "")
print(archEnemies.removeAll())
print(archEnemies.count, terminator: "")
print(archEnemies)


//
// Sets
//

// There is a third very common way to group data, called a Set
// Sets are similar to arrays, except you can’t add duplicate items,
// and they don’t store their items in a particular order.
// Creating a set works much like creating an array:
// tell Swift what kind of data it will store, then go ahead and add things.
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
// The standard method of creating a set is to create a normal array,
// then place it into a set: Set([stuff, goes, here])

// The ordering of a set is random:
print(people)

// When items are added individually, we no longer use the "append()" method used with arrays:
// "insert()" is used instead, which makes more sense semantically
var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")

// In addition to not allowing duplicate items and being unordered,
// Sets are meaningfully differentiated from Arrays in that they're optimized
// for incredibly fast search/lookup:
// If you have an array of 1000 movie names and use something like contains()
// to check whether it contains “The Dark Knight” Swift needs to go through
// every item until it finds one that matches –
// that might mean checking all 1000 movie names before returning false,
// because The Dark Knight wasn’t in the array.

// In comparison, calling contains() on a Set runs so fast you’d struggle
// to measure it meaningfully. Heck, even if you had a million items in
// the set, or even 10 million items, it would still run instantly,
// whereas an array might take minutes or longer to do the same work.

// In addition to "contains()", sets also have "count()" and "sorted()" methods, as
// dictionaries and arrays do


//
// Enums
//

// Enumerations (Enums) let us define a new data type with a handful 
// of specific values that it can have, sort of like custom boolean types
// that have more than two variations:
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
print(Weekday.monday)

enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}

// You can skip the enum name after the first assignment, like this:
var day = Weekday.monday
day = .tuesday
day = .friday
