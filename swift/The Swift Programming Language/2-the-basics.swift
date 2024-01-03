

// Basics of Variables and Constants

// constants can't change and should be written for values that never change
let maximumNumberOfLoginAttempts = 10
// variables can change/be updated later (see line 34)
var currentLoginAttempt = 0

// if desired, you can assign values to variables/constants after they are defined
let maximumNumberOfLoginAttempts2: Int

let environment = "development"
if environment == "development" {
    maximumNumberOfLoginAttempts2 = 100
} else {
    maximumNumberOfLoginAttempts2 = 10
}

// multiple constants or variables can be declared on a single line, separated by commas:
var x = 0.0, y = 0.0, z = 0.0


// Type Annotations

// You can provide a type annotation when you declare a constant or variable,
// to be clear about the kind of values the constant or variable can store:
var welcomeMessage: String
// The welcomeMessage variable can now be set to any string value without error:
welcomeMessage = "Hello"

// You can define multiple related variables of the same type on a single line,
// separated by commas, with a single type annotation after the final variable name:
var red, green, blue: Double


// Naming variables

// You can change the value of an existing variable to another value of a compatible type.
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"


/*
Printing
*/

// The print(_:separator:terminator:) function is a global function
// that prints one or more values to an appropriate output:
print(friendlyWelcome)

// To print a value without a line break after it, pass an empty string as the terminator
print(welcomeMessage, terminator: "")

// Swift uses string interpolation to include the name of a constant or variable as
// a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable.
print("The current value of friendlyWelcome is \(friendlyWelcome)")


/*
Comments and Semicolons
*/

// Comments in Swift are very similar to comments in C.
  
// Unlike multiline comments in C, multiline comments in Swift can be nested inside other multiline comments.
/* This is the start of the first multiline comment.
  /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */

// Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement
// in your code, although you can do so if you wish.
// Semicolons are required if you want to write multiple separate statements on a single line:
let cat = "🐱"; print(cat)


/*
Integers
*/

// Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms.
// These integers follow a naming convention similar to C

// You can access the minimum and maximum values of each integer type with its min and max properties:
let minValue = UInt.min
let maxValue = UInt8.max
let minValue2 = UInt64.max

// In most cases, you don’t need to pick a specific size of integer to use in your code.
// Swift provides an additional integer type, Int, which has the same size as the current platform’s native word size:
let mySpecialNumber: Int = 33
// Int is a signed integer type

// Swift also provides an unsigned integer type, UInt, which has the same size as the current platform’s native word size:
let anotherSpecialNumber: UInt = 22


/*
 Floating-point numbers
*/

// Floating-point numbers are numbers with a fractional component
// Floating-point types can represent a much wider range of values than integer types,
// and can store numbers that are much larger or smaller than can be stored in an Int.
// Use Double when possible for flexibility
let somethingHuge: Double = 2222.22


/*
 Type Safety and Type Inference
*/

// Type inference is particularly useful when you declare a constant or variable with an initial value.

// meaningOfLife is inferred to be of type Int
let meaningOfLife = 42
// pi is inferred to be of type Double
let pi = 3.14159
// anotherPi is also inferred to be of type Double
let anotherPi = 3 + 0.14159


/*
 Tuples
*/

// Tuples group multiple values into a single compound value.
// The values within a tuple can be of any type and don’t have to be of the same type as each other.

// http404Error is of type (Int, String), and equals (404, "Not Found")
let http404Error = (404, "Not Found")

// You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

// If you only need some of the tuple’s values,
// ignore parts of the tuple with an underscore (_) when you decompose the tuple:
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")

// Element names can be accessed with dot notation:
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"


/*
 Optionals
 */

// You set an optional variable to a valueless state by assigning it the special value nil:
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

// If you define an optional variable without providing a default value,
// the variable is automatically set to nil:
var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// You can use an if statement to find out whether an optional contains
// a value by comparing the optional against nil.
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}


/*
 Optional Binding
 */

// You use optional binding to find out whether an optional A) contains a value,
// and if so, to B) make that value available as a temporary constant or variable.
//     BBBBBBBBBBBB       AAAAAAAAAAAAAA
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

// If you don’t need to refer to the original, optional constant or variable
// after accessing the value it contains, you can use the same name for the new constant or variable:
let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// Prints "My number is 123"

// Because this kind of code is so common, you can use a shorter spelling
// to unwrap an optional value: Write just the name of the constant or variable that you’re unwrapping.
if let myNumber {
    print("My number is \(myNumber)")
}
// Prints "My number is 123"


/*
 Providing a Fallback Value
 */

// Another way to handle a missing value is to supply a default value
// using the nil-coalescing operator (??).
// If the optional on the left of the ?? isn’t nil, that value is
// unwrapped and used. Otherwise, the value on the right of ?? is used:
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)
// Prints "Hello, friend!"


/*
 Force Unwrapping
 */

// When nil represents an unrecoverable failure, such a programmer error
// or corrupted state, you can access the underlying value by adding an
// exclamation mark (!) to the end of the optional’s name:
let possibleNumber2 = "123"
let convertedNumber2 = Int(possibleNumber2)

let number = convertedNumber2!
print(number)
