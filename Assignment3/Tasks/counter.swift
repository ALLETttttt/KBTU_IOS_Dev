import Foundation


// Function to extract words using Regular Expressions
func extractWords(from text: String) -> [String] {
    let pattern = "\\b\\w+\\b"
    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return [] }
    let nsText = text.lowercased() as NSString
    let matches = regex.matches(in: text.lowercased(), options: [], range: NSRange(location: 0, length: nsText.length))
    return matches.map { nsText.substring(with: $0.range) }
}

// Function to count word frequencies using higher-order functions
func countWordFrequencies(words: [String]) -> [String: Int] {
    return words.reduce(into: [:]) { counts, word in
        counts[word, default: 0] += 1
    }
}

// Main Program
print("Word Frequency Counter")

print("Enter a sentence:")
guard let sentence = readLine(),
      !sentence.trimmingCharacters(in: .whitespaces).isEmpty else {
    print("No sentence entered.")
    exit(1)
}

let words = extractWords(from: sentence)
let frequencies = countWordFrequencies(words: words)

// Sorting the frequencies by count in descending order
let sortedFrequencies = frequencies.sorted { $0.value > $1.value }

print("\nWord Frequencies:")
for (word, count) in sortedFrequencies {
    print("\(word): \(count)")
}

