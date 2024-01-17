// 
// Return an Integer from an Optional Array
// 

// In a single line of code:
// Write a function that accepts an optional array of integers...
// ...and returns one randomly. 
// If the array is missing or empty, return a random number in the range 1 through 100.

func acceptance(_ optionalArray: [Int]?) -> Int { return optionalArray?.randomElement() ?? Int.random(in: 1...100) }

print(acceptance(nil))
print(acceptance([0, 1]))