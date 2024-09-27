import Foundation

// Memoization cache
var memo: [Int: Int] = [:]

// Recursive function with memoization
func fibonacci(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    if n == 1 { return 0 }
    if n == 2 { return 1 }
    if let cached = memo[n] {
        return cached
    }
    let value = fibonacci(n - 1) + fibonacci(n - 2)
    memo[n] = value
    return value
}

// Function to generate the Fibonacci sequence up to n elements
func generateFibonacciSequence(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    return (1...n).map { fibonacci($0) }
}

// Main Program
print("Fibonacci Sequence Generator")

print("Enter the number of Fibonacci numbers to generate:")
guard let input = readLine(),
      let count = Int(input),
      count >= 0 else {
    print("Invalid input. Please enter a non-negative integer.")
    exit(1)
}

let fibSequence = generateFibonacciSequence(count)
print("Fibonacci Sequence:")
print(fibSequence.map { String($0) }.joined(separator: ", "))

