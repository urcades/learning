// Getting Started
//
// Following along with https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/
//
// prints "Hello world!"
print("Hello world!")
//
// Code written at global scope is used as the entry point for the program, so you don’t need a main() function.
// You also don’t need to write semicolons at the end of every statement.

// Simple Values

// Use let to make a constant and var to make a variable.
var myVariable = 22
myVariable = 44
let myConstant = 88
// A constant or variable must have the same type as the value you want to assign to it.
// However, you don’t always have to write the type explicitly.
// If the initial value doesn’t provide enough information (or if there isn’t an initial value),
// specify the type by writing it after the variable, separated by a colon:
let implicitInteger = 22
let implicitDouble = 22.2
let explicitDouble: Double = 22
let explicitFloat: Float = 4
// Values are never implicitly converted to another type.
// If you need to convert a value to a different type, explicitly make an instance of the desired type:
let label = "The width is "
let width = 45
let widthLabel = label + String(width)
// There’s an even simpler way to include values in strings:
// Write the value in parentheses, and write a backslash (\) before the parentheses. For example:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
let myName = "Edouard"
let greetingSomeone = "Hey what's up \(myName)?"
let fpValueA: Float = 33.11
let fpValueB: Float = 44.88
let fpCalculation = "The added values are \(fpValueA + fpValueB)"
// Use three double quotation marks (""") for strings that take up multiple lines
// Indentation at the start of each quoted line is removed, as long as it matches
// the indentation of the closing quotation marks:
let quotation = """
    Even though there's whitespace to the left,
    the actual lines aren't indented.
        Except for this line.
    Double quotes (") can appear without being escaped.

    I still have \(apples + oranges) pieces of fruit.
    """
// Create arrays and dictionaries using brackets ([]),
// and access their elements by writing the index or key in brackets.
// A comma is allowed after the last element:
var fruits = ["strawberries", "limes", "oranges"]
fruits[1] = "grapes"
var jobs = [
    "Ed": "Whatever",
    "Jenny": "Cutie Pie",
]
jobs["Whiskey"] = "Cat"
// Arrays automatically grow as you add elements:
fruits.append("olives")
print(fruits)
// You also use brackets to write an empty array or dictionary.
// For an array, write [], and for a dictionary, write [:]:
fruits = []
jobs = [:]
// If you’re assigning an empty array or dictionary to a new variable,
// or another place where there isn’t any type information, you need to specify the type:
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

// Control Flow

// Use if and switch to make conditionals, and use
// for-in, while, and repeat-while to make loops.
// Parentheses around the condition or loop variable are optional.
// Braces around the body are required:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    // In an if statement, the conditional must be a Boolean expression
    if (score > 50) {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
// You can write if or switch after the equal sign (=)
// of an assignment or after return, to choose a value based on the condition:
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)

// You can use if and let together to work with values that might be missing.
// These values are represented as optionals.
// Write a question mark (?) after the type of a value to mark the value as optional.
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
//var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hey you no-named freak!"
}

// Another way to handle optional values is to provide a default value using the ?? operator.
let nickname: String? = nil
let fullName: String = "Johnny APpleseed"
let informalGreeting = "Hi, \(nickname ?? fullName)"

// Switches support any kind of data and a wide variety of comparison operations — 
// they aren’t limited to integers and tests for equality.
let veggie = "red pepper"
switch veggie {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwhich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in a soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 222, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var kindOfLargest = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOfLargest = kind
        }
    }
}
print("Largest number: \(largest) (\(kindOfLargest))")


var n = 2
while n < 0 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 0
print(m)

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

func greetWithCustomArguments(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greetWithCustomArguments("Whoever", on: "Monday")

// Use a tuple to make a compound value — for example, to return multiple values from a function.
// The elements of a tuple can be referred to either by name or by number.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

// Functions can be nested.
// Nested functions have access to variables that were declared in the outer function.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Functions are a first-class type. This means that a function can return another function as its value.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(33)

// A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Functions are actually a special case of closures: blocks of code that can be called later.
// You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// Objects and Classes
//
// Use class followed by the class’s name to create a class.
// A property declaration in a class is written the same way as a constant or variable declaration,
// except that it’s in the context of a class.
// Likewise, method and function declarations are written the same way.

class Shape {
    var numberOfSides = 0
    let health = 100
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func askSomething(holder: String) -> String {
        return "The holder of this \(numberOfSides)-sided shape is \(holder)"
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    let health = 100
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func askSomething(holder: String) -> String {
        return "The holder of this \(numberOfSides)-sided shape is \(holder)"
    }
}

var shape = Shape()
shape.numberOfSides = 22
var shapeDescription = shape.simpleDescription()
var shapeOwner = shape.askSomething(holder: "Jenny")
