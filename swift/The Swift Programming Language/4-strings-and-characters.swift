/*
 String Literals
 */

// A string literal is a sequence of characters surrounded by double quotation marks (")
let someString = "Some literal string value!!!"

// If you need a string that spans several lines, use a multiline string literal:
let quotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop."
    """

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""


/*
 Initializing an Empty String
 */

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

// Find out whether a String value is empty by checking its Boolean isEmpty property:
if emptyString.isEmpty {
    print("Nothing to see here...")
}


/*
 String Mutability
 */

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified


/*
 Working with Characters
 */

// iterating over characters in a string:
for c in "Dog!🐶" {
    print(c)
}

// the character type
let exclamationMark: Character = "!"

// String values can be constructed by passing an array of Character values as an argument to its initializer:
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)


/*
 Concatenating Strings
 */

let string1 = "hello"
let string2 = " there"
var whatever = string1 + string2
print(whatever)

var instruction = "look over"
instruction += string2
print(instruction)

// You can append a Character value to a String variable with the String type’s append() method:
whatever.append(exclamationMark)

// If you’re using multiline string literals to build up the lines of a longer string,
// you want every line in the string to end with a line break, including the last line. For example:
let badStart = """
    one
    two
    """
let end = """
    three
    """
print(badStart + end)
// Prints two lines:
// one
// twothree


let goodStart = """
    one
    two

    """
print(goodStart + end)
// Prints three lines:
// one
// two
// three


/*
 String Interpolation
 */

// String interpolation is a way to construct a new String value
// from a mix of constants, variables, literals, and expressions
// by including their values inside a string literal:
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

// You can use extended string delimiters to create strings containing
// characters that would otherwise be treated as a string interpolation.
print(#"Write an interpolated string in Swift using \(multiplier)."#)


/*
 Unicode
 */

// example of grapheme clustering in action:
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é


/*
 Counting Characters
 */

// To retrieve a count of the Character values in a string, use the count property of the string:
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

// Note that Swift’s use of extended grapheme clusters for Character values means that
// string concatenation and modification may not always affect a string’s character count.
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"


/*
 Accessing and Modifying a String
 */

// String Indices
// Each String value has an associated index type, String.Index,
// which corresponds to the position of each Character in the string.

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

for index in greeting.indices {
    print("\(greeting[index])", terminator: "/")
}


/*
 Substrings
 */

// When you get a substring from a string — for example, using a subscript or a method like prefix(_:)
// — the result is an instance of Substring, not another string.
let greeting2 = "Hello, world!"
let index2 = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
let beginning = greeting2[..<index2]
let newString = String(beginning)


/*
 Comparing Strings
 */

// Swift provides three ways to compare textual values: 
// string and character equality, prefix equality, and suffix equality.
let quotation2 =    "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}

// Characters here are considered linguistically equivalent
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

/* 
 Prefix and Suffix Equality
 */

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


/*
 Creating an Empty Array
 */

