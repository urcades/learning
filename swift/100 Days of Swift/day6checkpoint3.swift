// 
// Fizzbuzz
// 

// loop from 1 through 100
// If it’s a multiple of 3, print “Fizz”
// If it’s a multiple of 5, print “Buzz”
// If it’s a multiple of 3 and 5, print “FizzBuzz”
// Otherwise, just print the number.

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("Fizzbuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz") 
    } else {
        print(i)
    } 
}