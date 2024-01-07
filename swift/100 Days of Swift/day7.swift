// 
// Functions
// 

// When you’ve written some code you really like, and want to use again and again, 
// you should consider putting it into a function.
// Functions are just chunks of code you’ve split off from the rest of your program, 
// and given a name so you can refer to them easily.
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// () are used with functions. 
// They are used when you create the function, as you can see above, but also when you call the function
showWelcome()
// This is known as the function’s call site, which is a fancy name meaning “a place where a function is called.”

// what do parentheses actually do? Well, that’s where we add configuration options for our functions – 
// we get to pass in data that customizes the way the function works, so the function becomes more flexible:
let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}
// isMultiple(of:) is a function that belongs to integers. 
// If it didn’t allow any kind of customization, it just wouldn’t make sense – is it a multiple of what?
// Another example:
let roll = Int.random(in: 1...20)
// Again, random() is a function, and the (in: 1...20) part marks configuration options – 
// without that we’d have no control over the range of our random numbers, which would be significantly less useful.

// We can make our own functions that are open to configuration, 
// all by putting extra code in between the parentheses when we create our function:
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 2, end: 10)

// Final notes on semantics:
// 
// These are parameters:
// func printTimesTables(number: Int, end: Int) {...}
// 
// These are arguments:
// printTimesTables(number: 5, end: 20)
// 
// parameters are placeholder names that will get filled in with values 
// when the function is called, so that we have a name for those values inside the function.
// 
// arguments are the actual values that get sent into the function to work with, used to fill number and end.
// 
// when arguments are provided while calling a function, 
// they must always be listed in the order they were defined


// 
// Returning Values from Functions
// 

import Cocoa

let root = sqrt(169)
print(root)

// Returning values from functions requires two elements to be included in the function definition:
// 1. Write an arrow then a data type before your function’s opening brace, 
//    which tells Swift what kind of data will get sent back.
// 2. Use the return keyword to send back your data to the call site of the function
// Functions can omit a 'return' statement if the function is one line of code

// Example Function 1
func rollDice() -> Int {
    Int.random(in: 1...6)
}
let result = rollDice()
print(result)

// Example Function 2
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
var result2 = areLettersIdentical(string1: "tabby", string2: "acytb")
print("Are the two words equivalent?: \(result2)")

// Example Function 3
func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)


// 
// Returning multiple values from a function
// 

// tl;dr, use tuples to return multiple values from functions:
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

//  tuples have a key advantage over dictionaries: 
// we specify exactly which values will exist and what types they have, 
// whereas dictionaries may or may not contain the values we’re asking for.

// While using tuples to return multiple values, single-line returns are possible:
func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
// Swift already knows the names you’re giving each item in the tuple, 
// so you don’t need to repeat them when using return.

// Tuples do not require names in their parameter definition:
func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}
let user2 = getUser3()
print("Name: \(user.0) \(user.1)")
// This requires tuple elments to be accessed with indices 

// Tuple returns can be deconstructed back into single variables:
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")
// or ignored/disposed entirely:
let (firstName2, _) = getUser()
print("Name: \(firstName2)")


// 
// Customizing parameter labels
// 

// In addition to ordinary notation for parameters..
func isUppercase2(string: String) -> Bool {
    string == string.uppercased()
}
let string2 = "HELLO, WORLD"
// .. which are used while calling a function:
let result4 = isUppercase2(string: string2)

// we can write functions to ignore their parameter name using "_" before the parameter name in the function signature:
func isUppercase3(_ string: String) -> Bool {
    string == string.uppercased()
}
let string3 = "HELLO, WORLD"
let result5 = isUppercase3(string3)

// If it makes sense, or results in clearer function signatures, we can use an argument name:
//                    vvv
func printTimesTables(for number: Int) {
    for i in 1...12 {
        // the parameter name is used within the function's definition:
        //              vvvvvv           vvvvvv
        print("\(i) x \(number) is \(i * number)")
    }
}
// the argument name is used when calling the function:
//               vvv
printTimesTables(for: 5)