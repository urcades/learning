// 
// Creating Structs
// 

// create a struct to store information about a car, including its 
// 1. model, 
// 2. number of seats, 
// 3. and current gear, 
// 4. add a method to change gears up or down.

enum Gears {
    case drive, park, neutral
}

struct Car {
    let model: String    
    let seats: Int
    var gear: Gears = .park
    private var numberedGear: Int = 1

    mutating func shiftUp() -> () {
        if numberedGear < 10 {
            numberedGear += 1
            print("You've shifted up to gear \(numberedGear)")
        } else {
            print("You've hit the limit!")
        }
    }

     mutating func shiftDown() -> () {
        if numberedGear > 1 {
            numberedGear -= 1
            print("You've shifted down to gear \(numberedGear)")
        } else {
            print("You're already at first gear!")
        }
    }

    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
        // self.numberedGear = numberedGear
    }

    mutating func changeGear(to gear: Gears) -> String {
        switch gear {
        case .neutral:
            return "Car is in neutral."
        case .drive:
            return "You're driving now."
        case .park:
            return "You're parked now."
        }
    }
}

var newCar = Car(model: "Toyota", seats: 4)
print(newCar.changeGear(to: .drive))

newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftDown()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftUp()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()
newCar.shiftDown()