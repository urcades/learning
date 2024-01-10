// 
// Access Control for Structs
// 

// By default, Swift’s structs let us access their properties and methods freely, 
// but often that isn’t what you want – sometimes you want to hide some data from external access.
// Example:
struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
// This struct has methods to deposit and withdraw money from a bank account, and should be used like this:
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
// howver, nothing is stopping funds from being accessed externally:
account.funds -= 1000

// This can be fixed by marking the property as private:
// private var funds = 0
// Marking a property as private means that only the struct's methods, computer properties, property observers, etc.

// Swift has a few common access control flags:
// 1. "private"         for     “don’t let anything outside the struct use this.”
// 2. "fileprivate"     for     “don’t let anything outside the current file use this.”
// 3. "public"          for     “let anyone, anywhere use this.”
// 4. "private(set)"    for     “let anyone read this property, but only let my methods write it.”

// Important: If you use private access control for one or more properties, 
// chances are you’ll need to create your own initializer.


// 
// Static Properties and methods
// 

// sometimes you want to add a property or method to the struct itself, 
// rather than to one particular instance of the struct, which allows you to use them directly.
// Example:
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
// Notice the keyword static in there, which means both the studentCount property and add() method 
// belong to the School struct itself, rather than to individual instances of the struct.

// To use that code, we’d write the following:
School.add(student: "Taylor Swift")
print(School.studentCount)

// Static data/properties/methods are useful for organizing common data in apps:
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
// Using this approach, everywhere I need to check or display something 
// like my app’s version number – an about screen, debug output, logging information, 
// support emails, etc – I can read AppData.version.

// The second reason I commonly use static data is to create examples of my structs:
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
//  Now whenever you need an Employee instance to work with in your design previews, 
// you can use Employee.example and you’re done.