
import Foundation



func sieveOfEratosthenes(upTo limit: Int) -> [Int] {
    guard limit >= 2 else { return [] }
    var isPrime = Array(repeating: true, count: limit + 1)
    isPrime[0] = false
    isPrime[1] = false
    
    let sqrtLimit = Int(Double(limit).squareRoot())
    for number in 2...sqrtLimit {
        if isPrime[number] {
            for multiple in stride(from: number * number, through: limit, by: number) {
                isPrime[multiple] = false
            }
        }
    }
    
    var primes: [Int] = []
    for (index, prime) in isPrime.enumerated() {
        if prime {
            primes.append(index)
        }
    }
    return primes
}

// Main Program
let primes = sieveOfEratosthenes(upTo: 100)
print("Prime numbers between 1 and 100:")
print(primes.map { String($0) }.joined(separator: ", "))
