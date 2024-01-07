//
// Conditions
//

//Swift handles choices in code with if statements,
// which let us check a condition and run some code if the condition is true

// If 2 is greater than 1, print something:
if 2 > 1 {
    print("Do something")
}

// Comparison operators work with Strings as well:
let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"
if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Complex behavior can be modeled with if statements:
// Make an array of 3 numbers
var numbers = [1, 2, 3]
// Add a 4th
numbers.append(4)
// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}
// Display the result
print(numbers)

// Conditionals can be used to set default values if nothing is provided:
var username = "taylorswift13"
if username == "" {
    username = "Anon"
}
print("Welcome, \(username)!")
// The "" is an empty string: we start the string and end the string, with nothing in between.
// By comparing username to that, we’re checking if the user also entered an empty string for their username
// comparing strings against each other (Line 38) is slow however!
// there are other ways of doing this check:
// We could check if the length of the string is equal to zero:
if username.count == 0 {
    username = "Anon"
}
// "count" is slow however, as Swift's implementation of count requires iteration through the entire String
// Instead, we can use ".IsEmpty":
if username.isEmpty == true {
    username = "Anonymous"
}
// Swift adds this piece of functionality to all its strings, arrays, dictionaries, and sets
// for quick checking for empty collections
// We can simplify the code further because "isEmpty" returns a boolean value by default:
if username.isEmpty {
    username = "Anonymous"
}


//
// Else and Else If
//

// Swift provides us with a more advanced condition that
// lets us add an else block to our code – some code to run if the condition is not true:
let age = 16
if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

// There’s an even more advanced condition called else if,
// which lets you run multiple checks if the first one fails:
let a = false
let b = true
if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

// Each of these conditional structures can check more than one expression:
// If we need both statements to be true, we can use an AND operator
let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}
// If we only need one statement to be true, we can use an OR operator
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

// A complex example that showcases each of these conditional statements and operators:
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic")
} else {
    print("I'm going to hire a scooter now!")
}

//  Any time you mix && and || in a single condition you should use parentheses to make the result clear:
let isEditingEnabled = true
let isAdmin = true
let isOwner = true
if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}

//
// Switch
//

// Using if/else conditions to check multiple cases of code (such as what might be found in an enum)
// can be tedious an error-prone:
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
// here, you can see it's possible to accidentally repeat conditions or even omit them
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}

// switch conditions are more succinct, and aware of enums:
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

// switch statements must be exhaustive, which means:
// 1. when using a switch statement with enums, all enum cases must be listed
// 2. when using a switch statement with anything else, you can provide a default case at the end:
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

// normally only one case in a switch conditional is used, but in rare/specific instances
// you can use "fallthrough" to include the effects of other cases even if only one case matches
// this is exemplified in "The 12 days of christmas" where verses compound on one another:
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


//
// Ternary Conditional Operators
//

// There’s one last way to check conditions in Swift, called the ternary conditional operator
// The ternary operator lets us check a condition and return one of two values:
// something if the condition is true, and something if it’s false:
let myAge = 14
let canVote = myAge >= 18 ? "Yes" : "No"

// Another example:
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

// Another example:
let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

// Another example:
enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)
