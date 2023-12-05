print("")
// Let's fucking go
// In Swift...
// You don’t need to import a separate library for functionality like input/output or string handling. 
// Code written at global scope is used as the entry point for the program, so you don’t need a main() function. 
// You also don’t need to write semicolons at the end of every statement.
print("Hello, world!")

print("")
// Variables and Constants
// The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once.
var myVariable = 42
myVariable = 50
let myConstant = 1000
print("My variable is:", myVariable)
print("My constant is:", myConstant)

print("")
// Implicit and Explicit Types
// Values are never implicitly converted to another type.
// Most of the time, implicit types work as expected
let implicitInteger = 44
let implicitDouble = 33.33
let explicitDouble: Double = 44.44
let explicitFloat: Float = 4

print("")
// Values are never implicitly converted to another type.
let label = "The width is "
let width = 99
let widthLabel = label + String(width)
print(widthLabel)
// A simpler way to incorporate values in strings is via the \() string formatting syntax:
let apples = 5
let oranges = 8
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit!"
print(appleSummary)
print(fruitSummary)
