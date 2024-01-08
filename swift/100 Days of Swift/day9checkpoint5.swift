// 
// Chaining closures (  sorted(), filter(), map()  )
// 

// Given the provided input:
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// Filter out any numbers that are even
// Sort the array in ascending order
// Map them to strings in the format “7 is a lucky number”
// Print the resulting array, one item per line

// first attempt, getting a warning:
// luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $1 > $0 }.map {print("\($0) is a lucky number!")}

// second attempt, is this considered a temp variable?
let _ = luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $1 > $0 }.map {print("\($0) is a lucky number!")}