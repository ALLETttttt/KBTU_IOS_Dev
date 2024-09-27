import Foundation


// Function to check for unique characters using a Set
func hasUniqueCharacters(_ text: String) -> Bool {
    let characters = Array(text)
    let uniqueCharacters = Set(characters)
    return uniqueCharacters.count == characters.count
}

// Alternative approach using reduce
func hasUniqueCharactersUsingReduce(_ text: String) -> Bool {
    let result = text.reduce(into: Set<Character>()) { (set, char) in
        if set.contains(char) {
            // Early exit by setting a flag (not directly possible in reduce)
            // Hence, we check outside
        }
        set.insert(char)
    }
    return result.count == text.count
}

// Main Program
print("Unique Characters Checker")

print("Enter a string to check for unique characters:")
guard let inputText = readLine(),
      !inputText.isEmpty else {
    print("No string entered.")
    exit(1)
}

if hasUniqueCharacters(inputText) {
    print("All characters in \"\(inputText)\" are unique.")
} else {
    print("There are duplicate characters in \"\(inputText)\".")
}

