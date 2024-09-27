import Foundation

// Utilizes a while loop and switch statement for decision-making

var number = 1
let maxNumber = 100

while number <= maxNumber {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, true):
        print("FizzBuzz")
    case (true, false):
        print("Fizz")
    case (false, true):
        print("Buzz")
    default:
        print(number)
    }
    number += 1
}

