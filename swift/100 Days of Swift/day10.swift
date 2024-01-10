//
// Structs
//

// Structs are one of the ways Swift lets us create our own data types out of several small types.
// Most of Swift’s own types are implemented as structs, including String, Int, Bool, Array, and more.
// A simple struct looks like this:
struct Album {
    let title: String
    let artist: String
    let year: Int
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

// When you want to create a struct where it's internal values can change, that's where things get interesting:
struct Employee {
//  variables and constants that belong to structs are called properties
    let name: String
    var vacationRemaining: Int
//  functions that belong to structs are called methods
//  If a function is marked "mutating", instances of Employee must remain variable, not set as constant
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining!")
        }
    }
}
// This is called an initializer: A variable or constant is being initialized with a filled-in struct
print("\nARCHER 1 VALUES")
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)


//
// Computing struct property values dynamically
//

// Structs can have two different types of property:
//   1. stored properties: variables or constants that hold data inside an instance of a struct
//   2. computed properties: computed properties calculate the value of the property dynamically every time it's accessed
// Computed properties are a blend of stored properties and functions, they are accessed like stored properties but work like functions

// This is an example of a trivial struct without computed properties:
struct Employee2 {
    let name: String
    var vacationRemaining: Int
}
print("\nARCHER 2 VALUES")
var archer2 = Employee2(name: "Berling Barcher", vacationRemaining: 14)
archer2.vacationRemaining -= 5
print(archer2.vacationRemaining)
archer2.vacationRemaining -= 3
print(archer2.vacationRemaining)

// This example results in a struct that looses valuable information over time, such as how many days our employee was originally granted

struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    var vacationRemaining: Int {
        get { vacationAllocated - vacationTaken }
        set { vacationAllocated = vacationTaken + newValue}
    }
}

// Now rather than making vacationRemaining something we can assign to directly, 
// it is instead calculated by subtracting how much vacation they have taken from how much vacation they were allotted.
print("\nARCHER 3 VALUES")

var archer3 = Employee3(name: "Sterling Archer", vacationAllocated: 14)

archer3.vacationTaken += 4
print("\(archer3.vacationRemaining) of \(archer3.vacationAllocated) vacation days remaining after \(archer3.vacationTaken) were taken")

archer3.vacationRemaining = 5
print("\(archer3.vacationRemaining) of \(archer3.vacationAllocated) vacation days remaining after \(archer3.vacationTaken) were taken")


//
// Taking action when a property changes
//

print("\n")
// property observers are special pieces of code that run when properties change. 
// They take two forms: 
//   1. a didSet observer to run when the property just changed 
//   2. a willSet observer to run before the property changed.

// To see why property observers might be needed, think about code like this:
struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")

game.score -= 3
print("Score is now \(game.score)")
game.score += 1        // a mistake!

// With property observers we can solve this problem 
// by attaching the print() call directly to the property 
// using didSet, so that whenever it changes 
// we will always run some code:

print("\n")
struct Game2 {
    var score = 0 {
        didSet {
        // Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from.
            print("Score is now \(score)")
        }
    }
}

var game2 = Game2()
game2.score += 10
game2.score += 3
game2.score += 1

// Another Example

print("\n")
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
            print("\n")
        }
    }
}

var app = App()
app.contacts.append("ROM")
app.contacts.append("MAK")
app.contacts.append("YOU")
app.contacts.append("ED")


//
// Custom Initializers
//

// Initializers are specialized methods that are designed to prepare a new struct instance to be used.
// Swift silently generates an initializer accepting the values of a struct, but we can write our own to do the same thing:
struct Player {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}
// you can also create your own as long as you follow one golden rule: 
// all properties must have a value by the time the initializer ends.