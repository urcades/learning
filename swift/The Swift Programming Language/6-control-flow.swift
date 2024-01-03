/*
For-In Loops
*/

// You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// You can also iterate over a dictionary to access its key-value pairs.
// The contents of a Dictionary are inherently unordered, and iterating over them doesn’t guarantee the order in which they will be retrieved.
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// You can also use for-in loops with numeric ranges:
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// If you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a variable name.
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// In some situations, you might not want to use closed ranges, which include both endpoints.
// Use the half-open range operator (..<) to include the lower bound but not the upper bound.
let minutes = 60
for tickMark in 0..<minutes {
    // render the fick mark each minute (60 times)
}
// Some users might want fewer tick marks in their UI.
// Use the stride(from:to:by:) function to skip the unwanted marks.
let minuteInterval = 5
for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
// Closed ranges are also available, by using stride(from:through:by:) instead:
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}
// The examples above use a for-in loop to iterate ranges, arrays, dictionaries, and strings.
// However, you can use this syntax to iterate any collection, including your own classes 
// and collection types, as long as those types conform to the Sequence protocol.


// While Loops

// A while loop performs a set of statements until a condition becomes false.
// These kinds of loops are best used when the number of iterations isn’t known before the first iteration begins.
// Swift provides two kinds of while loops:
// while evaluates its condition at the start of each pass through the loop.
// repeat-while evaluates its condition at the end of each pass through the loop.

// While
// A while loop starts by evaluating a single condition. 
// If the condition is true, a set of statements is repeated until the condition becomes false.

// Snakes and Ladders Example

// Initializing the board with a final square value and an array of 0s
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

// To align the values and statements, the unary plus operator (+i) is explicitly used with \
// the unary minus operator (-i) and numbers lower than 10 are padded with zeros. 
// (Neither stylistic technique is strictly necessary, but they lead to neater code.)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

// Game logic
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice (simplified incrementing dice, not random)
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over! (While)")

// A while loop is appropriate in this case, 
// because the length of the game isn’t clear at the start of the while loop. 
// Instead, the loop is executed until a particular condition is satisfied.


// Repeat-While

// The other variation of the while loop, known as the repeat-while loop, 
// performs a single pass through the loop block first, before considering the loop’s condition.
// It then continues to repeat the loop until the condition is false.

// Values are initialized in the same way:
let finalSquare2 = 25
var board2 = [Int](repeating: 0, count: finalSquare2 + 1)
board2[03] = +08; board2[06] = +11; board2[09] = +09; board2[10] = +02
board2[14] = -10; board2[19] = -11; board2[22] = -02; board2[24] = -08
var square2 = 0
var diceRoll2 = 0

// In this version of the game, the first action in the loop is to check for a ladder or a snake.
// No ladder on the board takes the player straight to square 25
// and so it isn’t possible to win the game by moving up a ladder.
// Therefore, it’s safe to check for a snake or a ladder as the first action in the loop.
// At the start of the game, the player is on “square zero”. board[0] always equals 0 and has no effect.
// The loop’s condition (while square < finalSquare) is the same as before, but this time it’s not evaluated until the end of the first run through the loop.
repeat {
    // move up or down for a snake or ladder
    square2 += board2[square2]
    // roll the dice
    diceRoll2 += 1
    if diceRoll2 == 7 { diceRoll2 = 1 }
    // move by the rolled amount
    square2 += diceRoll2
} while square2 < finalSquare2
print("Game over! (Repeat-While)")


// Conditional Statements

// Swift provides two ways to add conditional branches to your code: the if statement and the switch statement. 
// Typically, you use the if statement to evaluate simple conditions with only a few possible outcomes.
// The switch statement is better suited to more complex conditions with multiple possible permutations

// If 

// In its simplest form, the if statement has a single if condition. It executes a set of statements only if that condition is true.
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider weating a scarf.")
}
// The if statement can provide an alternative set of statements, known as an else clause, for situations when the if condition is false.
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}
// You can chain multiple if statements together to consider additional clauses.
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}
// Because the temperature isn’t cold enough to trigger the if condition or warm enough to trigger the else if condition, no message is printed.
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

// If statements can be used to conditionally assign a variable:
let temperatureInCelsius = 25
let weatherAdvice = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)

// All of the branches of an if expression need to contain values of the same type.
// Values like nil that can be used with more than one type prevent Swift from determining the if expression’s type automatically.
// Instead, you need to specify the type explicitly — for example:
let freezeWarning: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}
print(freezeWarning)
// An alternate way to provide this type information is to provide an explicit type for nil, instead of providing an explicit type for freezeWarning:
let freezeWarning2 = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}
print(freezeWarning)


// Switch

// A switch statement considers a value and compares it against several possible matching patterns.
// It then executes an appropriate block of code, based on the first pattern that matches successfully.
// A switch statement provides an alternative to the if statement for responding to multiple potential states.
// 
// Every switch statement consists of multiple possible cases, each of which begins with the case keyword.
// Every switch statement must be exhaustive. That is, every possible value of the type being considered must be matched by one of the switch cases.
// You can define a default case to cover any values that aren’t addressed explicitly. 
// This default case is indicated by the default keyword, and must always appear last.
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet.")
case "z":
    print("The last letter of the Latin alphabet.")
default:
    print("Some other character.")
}

// Like if statements, switch statements also have an expression form:
let anotherCharacter: Character = "a"
let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}
print(message)

// To make a switch with a single case that matches both "a" and "A", combine the two values into a compound case, separating the values with commas.
let yetAnotherCharacter: Character = "a"
switch yetAnotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// Interval Matching

// Values in switch cases can be checked for their inclusion in an interval. 
// This example uses number intervals to provide a natural-language count for numbers of any size:
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
    
}
print("There are \(naturalCount) \(countedThings)")

// Tuples

// You can use tuples to test multiple values in the same switch statement.
// Each element of the tuple can be tested against a different value or interval of values. 
// Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value:
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

// Value Bindings

// A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case.
// This behavior is known as value binding, because the values are bound to temporary constants or variables within the case’s body.
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// Where

// A switch case can use a "where" clause to check for additional conditions:
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Compound Cases

// Multiple switch cases that share the same body can be combined by writing several patterns after case,
// with a comma between each of the patterns.
// If any of the patterns match, then the case is considered to match.
// The patterns can be written over multiple lines if the list is long.
let someCharacter2: Character = "e"
switch someCharacter2 {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter2) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter2) is a consonant")
    default:
        print("\(someCharacter2) isn't a vowel or a consonant")
}
// Compound cases can also include value bindings.
// All of the patterns of a compound case have to include the same set of value bindings, 
// and each binding has to get a value of the same type from all of the patterns in the compound case. 
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}