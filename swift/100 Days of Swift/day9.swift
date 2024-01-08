// 
// Closures
// 

// you can assign functions to variables, pass functions into functions, and even return functions from functions:
// defining a function:
func greetUser() {
    print("Hello there.")
}
// calling a function:
greetUser()
// assigning a function to a variable:
var greetCopy = greetUser
// calling a variable-function (a closure)
greetCopy()

// IMPORTANT: When you’re copying a function, you don’t write the parentheses after it.
//            If you put the parentheses there you are calling the function 
//            and assigning its return value back to something else.

// What if you wanted to skip creating a separate function, 
// and just assign the functionality directly to a constant or variable? (you can do this):
let sayHello =  {
    print("Hi there.")
}
sayHello()

// If you want closures to accept parameters, you need to situate the parentheses 
// **inside** the brackets that define the closure:
let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello2("mei")
// "in" is used to mark the end of the parameters and return type – 
// everything after that is the body of the closure itself.

// The type annotation for a variable holding a closure that..
// 1. accepts no parameters
// 2. returns no value
// 3. throws no errors
var greetCopy2: () -> Void = greetUser
//              ^^    ^^^^ 
//              ^^    ^^^^ Void means that the closure returns nothing, can be written as ()
//              ^^
//              ^^ empty parentheses means the closure takes no parameters

// Every function’s type depends on the __data__ it receives and sends back. 
// the __names__ of the data it receives are not part of the function’s type.
// Example:
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

sayHello2(user)

// the sorted() function for collections is able to have its sort customized with a specific optional signature
// that takes a closure as a parameter
// This function must accept two strings, and return true if the first string should be sorted before the second, 
// or false if the first string should be sorted after the second.
// Example:
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sortedTeam = team.sorted()
print(sortedTeam)
// The code above demonstrates the default behavior of sorted()

// We can define our own sorting closure based on the data signature required by sorted():
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// because the parameter signature of captainFirstSorted() matches the closure requirements of sorted(), it just works: 
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// This code can be written using straight up closure syntax: 
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(captainFirstTeam2)


// 
// Trailing Closures and shorthand syntax
// 

// When one function accepts another as its parameter, like sorted() does, 
// Swift allows special syntax called "trailing closure syntax". It looks like this:
let captainFirstTeam3 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
// To simplify further, we can actually omit the type and return params from the closure itself, since it
// _needs_ to conform to the function it's being provided to:
print(captainFirstTeam3)

// Swift can automatically provide parameter names for us, using shorthand syntax.
// With this syntax we don’t even write name1, name2 in any more, 
// and instead rely on specially named values that Swift provides for us: $0 and $1, 
// for the first and second strings respectively:
let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
print(captainFirstTeam4)
// This is a pretty obscure way to write closure code though
// Author's rules for when NOT to write shorthand closure syntax:
//  1. The closure’s code is long.
//  2. $0 and friends are used more than once each.
//  3. You get three or more parameters (e.g. $2, $3, etc).

// Other useful closure examples

// the filter() function lets us run some code on every item in the array, 
// and will send back a new array containing every item that returns true for the function.
let tOnly = team.filter { $0.hasPrefix("T") }
// This is an example of a one-liner closure supplied to ".filter()", and uses shorthand syntax
print(tOnly)

// the map() function lets us transform every item in the array using 
// some code of our choosing, and sends back a new array of all the transformed items:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// 
// Accepting functions as parameters
// 

// Reiterating the first example of function types:
func greetUser2() {
    print("Hello there!")
}

greetUser2()

var greetCopy3: () -> () = greetUser2
greetCopy3

// Example of defining a function that takes in other functions as a parameter:
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
// Breaking this down:
// 1. The function is called makeArray(). It takes two parameters, 
//    one of which is the number of integers we want, and also returns an array of integers.
// 2. The second parameter is a function. This accepts no parameters 
//    itself, but will return one integer every time it’s called.
// 3. Inside makeArray() we create a new empty array of integers, then loop as many times as requested.
// 4. Each time the loop goes around we call the generator function 
//    that was passed in as a parameter. This will return one new integer, so we put that into the numbers array.
// 5. Finally the finished array is returned.

// If one or more of a function’s final parameters are functions, you can use trailing closure syntax.
let rolls = makeArray(size: 10) {
    Int.random(in: 1...20)
}

print(rolls)