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
// inside the brackets that define the closure:
let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}
print(sayHello2("mei"))