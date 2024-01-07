//
// Variables and Constants
//

// Variables can be changed over time
var name = "Edouard"
name = "Jenny"
name = "Sylvia"
name = "Whiskey"

// Constants cannot be reassigned after they are created
let character = "Daphne"

var playerName = "Roy"
print(playerName)
playerName = "Daniel"
print(playerName)


//
// Strings
//

// Swift’s strings start and end with double quotes
let actor = "Denzel Washington"

// Besides letters, punctuation, emoji, and other characters can be contained within strings:
let filename = "whatever.jpg"
let result = "⭐️ You win! ⭐️"
// Other double quotes can be contained in a string by escaping them:
let quote = "Then he tapped the sign saying \"Believe\" and walked away."
// Strings that require linebreaks need three double quotes:
let movie = """
    A day in
    the life of an
    Apple engineer
    """

// Three useful functions that can be performed on Strings:

// Reading the length of a string:
print(actor.count)
let nameLength = actor.count
print(nameLength)

// Uppercasing strings:
print(result.uppercased())

// A quick aside:
// ".count" and ".uppercased()" are both functions,
// but ".count" is like "reading" data, whereas
// ".uppercased()" is "working" on data.
//
// OK — back to useful functions:

// Checking if a string starts with letters of our choosing:
print(movie.hasPrefix("A day"))
// and the counterpart, ".hasSuffix()":
print(filename.hasSuffix(".jpg"))


//
// Storing Whole Numbers
//

// When you’re working with whole numbers such as 3, 5, 50, or 5 million,
// you’re working with what Swift calls integers, or "Int" for short:
let score = 10
let reallyBigButHardToRead = 100000000
// You can use underscores, _, to break up numbers however you want:
let reallyBigAndLegible = 100_000_000

// You can also create integers from other integers using arithmetic operators:
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

// We can update values stored in variables:
var counter = 10
counter = counter + 5

// Compound assignment operators are a good shorthand method for update variables:
counter += 5
print(counter)
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

// Like Strings, Integers have useful functionality associated with them.
// One example is "isMultiple(of:)" to find out whether an Int is a multiple of another Int:
let number = 120
print(number.isMultiple(of: 3))
// You can call these functions directly on numbers:
print(122.isMultiple(of: 3))


//
// Storing Decimal Numbers
//

// When you create a floating-point number, Swift considers it to be of type "Double".
// Floating Point numbers are notoriously hard to get right:
let FPnumber = 0.1 + 0.2
print(FPnumber)

// You can't add integers to floating point numbers:
 let a = 1
 let b = 2.0
// (This produces an error when uncommented:
// let c = a + b

// To add two different number types together, they need to be cast into new types:
let c =         a + Int(b)
let d = Double(a) + b

// Decimal numbers have the same range of operators and compound assignment operators as integers:
var rating = 5.0
rating *= 2