import Foundation



enum Operation: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    
    static func fromInput(_ input: String) -> Operation? {
        return Operation(rawValue: input)
    }
}

struct Calculator {
    func performOperation(_ op: Operation, a: Double, b: Double) -> Double? {
        switch op {
        case .addition:
            return a + b
        case .subtraction:
            return a - b
        case .multiplication:
            return a * b
        case .division:
            guard b != 0 else { return nil }
            return a / b
        }
    }
}

// Main Program
let calculator = Calculator()

print("Simple Calculator")

// Function to get user input with a prompt
func getInput(prompt: String) -> String? {
    print(prompt, terminator: " ")
    return readLine()
}

while true {
    if let firstInput = getInput(prompt: "Enter the first number (or type 'exit' to quit):") {
        if firstInput.lowercased() == "exit" {
            print("Exiting Calculator. Goodbye!")
            break
        }
        
        guard let num1 = Double(firstInput) else {
            print("Invalid number. Please try again.")
            continue
        }
        
        guard let secondInput = getInput(prompt: "Enter the second number:"),
              let num2 = Double(secondInput) else {
            print("Invalid number. Please try again.")
            continue
        }
        
        guard let operationInput = getInput(prompt: "Choose an operation (+, -, *, /):"),
              let operation = Operation.fromInput(operationInput),
              ["+", "-", "*", "/"].contains(operation.rawValue) else {
            print("Invalid operation. Please choose from +, -, *, /.")
            continue
        }
        
        if operation == .division && num2 == 0 {
            print("Error: Division by zero is undefined.")
            continue
        }
        
        if let result = calculator.performOperation(operation, a: num1, b: num2) {
            print("Result: \(result)")
        } else {
            print("An error occurred during calculation.")
        }
    } else {
        print("Invalid input.")
    }
}

