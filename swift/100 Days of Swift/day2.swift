//
// Booleans
//

// Boolean values are either True or False
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false

// Unlike the other types of data, Booleans don’t have arithmetic operators such as + and -
// However, Booleans do have one special operator, !, which means “not”.
// This flips a Boolean’s value from true to false, or false to true:
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Boolean values do have some functions associated with them, such as "toggle()":
print(gameOver)
gameOver.toggle()
print(gameOver)


//
// Joining Strings
//

// Swift gives us two ways to combine strings together:
// joining them using "+", called concatenation
// a technique called string interpolation that can place variables of any type directly inside strings.

// String Concatenation
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart
// Many strings can be concatenated at once:
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)
// Concatenation can be wasteful if many elements are joined at once:
let luggageCode = "1" + "2" + "3" + "4" + "5"

// String Interpolation
// String interpolation makes use of escapes..
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
// ..but facilitates the use of any value in place of an escape sequence:
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)
// String interpolation is much more efficient than using + to join strings one by one,
// but there’s another important benefit too:
// you can pull in integers, decimals, and more with no extra work.