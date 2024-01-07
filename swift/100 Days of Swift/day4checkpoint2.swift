//
// Create an Array of Strings
// Print the number of items in the array
// Print the numner of unique items in the array
//

// The idea is to create an array I can freely append to,
// which implies that I can provide duplicat entries (on purpose or by accident)
var arr = [String]()
arr.append("Ed")
arr.append("Romina")
arr.append("Mackenzie")
arr.append("Mackenzie")
arr.append("Jimmy")
arr.append("Jimmy")
arr.append("Jimmy")
arr.append("Jimmy")
arr.append("Jimmy")
arr.count

// Casting the array into a Set type ensures that duplicate values are discarded,
// so performing a count on my new set returns the number of unique values in my OG array.
let arrToSet = Set(arr)
arrToSet.count

print("My original array contained \(arr.count) total items and \(arrToSet.count) unique items!")
