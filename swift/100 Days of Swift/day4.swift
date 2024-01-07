//
// Type Annotations
//

// While Swift is able to perform type inference most of the time, explicit type annotation is possible:
let surname: String = "Lasso"
var score: Int = 0
var doubleScore: Double = 0
var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@yokelisms"]
var books: Set = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// If you want to create empty collections, type annotation is one possibility:
var teams: [String] = [String]()
// Type inference is another:
var clues = [String]()

// Enums are one way to create our own types:
enum UIStyle {
    case light, dark, system
}
var style = UIStyle.light

// The author of this book prefers to use type inference whenever possible,
// with a sole exception to constants, which require type annotations even when initialized without a value:
let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)
