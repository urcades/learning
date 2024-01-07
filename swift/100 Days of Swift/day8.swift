// 
// Default parameter values
// 

// Sometimes you want a parameter to have a sensible default, but allow for customization:
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

// This is seen in a lot of built-in functions:
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
// by default, removeAll frees up the memory of the array it removes items from, which is common
// if you really want to keep the array's capacity after removing its elements, you can alter its default behavior:
// characters.removeAll(keepingCapacity: true)
print(characters.count)


// 
// Handling errors in functions
// 

// we need to start by defining the possible errors that might happen. 
// This means making a new enum that builds on Swift’s existing Error type, like this:
enum PasswordError: Error {
    case short, obvious 
}

// If a function is able to throw errors without handling them itself, 
// you must mark the function as "throws" before the return type.
// Being marked with throws does not mean the function must throw errors, only that it might.
//                                     vvvvvv
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let passwordString = "12345"
// A block of work that might throw errors:
do {
    // try must be written before calling all functions that might throw errors, 
    // and is a visual signal to developers that regular code execution will be interrupted if an error happens.
    //                   vvv
    let result = try checkPassword(passwordString)
    print("Password rating: \(result)")
// the catch block must exhaustively catch all possible errors
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}