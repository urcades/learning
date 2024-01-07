// 
// For Loops
// 

// Swift makes it easy to repeat some code a fixed number of times, or once for every item in an array, dictionary, or set.
// If we have an array of strings, we can print each string out like this:
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os)")
}

// Rather than looping over an array (or set, or dictionary – the syntax is the same!), 
// you can also loop over a fixed range of numbers:
for item in 1...10 {
    print("5 x \(item) is \(5 * item)")
}
// Notice: ranges are their own data type in Swift
// "x...y" ranges include the x and y, but you can create exclusive ranges too:
for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// You can embed loops within loops:
for i in 1...12 {
    print("The \(i) times table:")
    for j in 1...12 {
        // note that "i" from the outer loop can be used in the inner loop:
        print("  \(j) x \(i) is \(j * i)")
    }
    print()
}

// If you don't need the loop variable for output, you can ignore it with "_":
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)


// 
// While Loops
// 

// Swift has a second kind of loop called while:
// Provide it with a condition, and a while loop will continually execute the loop body until the condition is false.
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// while loops are really useful when you just don’t know how many times the loop will go around.
// take random numbers:
let id = Int.random(in: 1...1000)
print(id)
let amount = Double.random(in: 0...1)
print(amount)
// We can use this functionality with a while loop to 
// roll some virtual 20-sided dice again and again, ending the loop only when a 20 is rolled:
var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical hit!")


// 
// Skipping loops with break and continue
// 

// Swift gives us two ways to skip one or more items in a loop: 
// continue skips the current loop iteration, 
// and 
// break skips all remaining iterations. 
// Like while loops these are sometimes used, but in practice much less than you might think.

// When you’re looping over an array of data, Swift will take out one item from the array 
// and execute the loop body using it. 
// If you call "continue" inside that loop body, Swift will immediately 
// stop executing the current loop iteration 
// and jump to the next item in the loop, where it will carry on as normal:
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

// As for break, that exits a loop immediately and skips all remaining iterations.
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)