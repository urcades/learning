// 
// Square Roots
// 

// write a function that accepts an integer from 1 through 10,000
// and returns the integer square root of that number.
// 
// You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
// If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
// You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
// If you can’t find the square root, throw a “no root” error.

enum squareRootError: Error {
    case outOfBounds, noRoot
}

func squareRootOf(_ number: Int) throws -> Int {
    // if a number is provided that's out of bounds, throw an error
    if number < 1 || number > 10_000 {
        throw squareRootError.outOfBounds
    }
    // if a number along the path to the specified number "i", 
    // multiplied against itself (i * i), equals the provided number,
    // then it's the square root of the number
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    // if the for loop exits without returning a number, then throw an error
    throw squareRootError.noRoot
}

let myNumber = 10_000

do {
    let result = try squareRootOf(myNumber)
    print("The square root of \(myNumber) is \(result)")
} catch squareRootError.outOfBounds {
    print("Your number is out of bounds.")
} catch squareRootError.noRoot {
    print("Your number's square root isn't an integer.")
}