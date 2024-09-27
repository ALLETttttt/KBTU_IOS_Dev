import Foundation



// Function to sanitize the input text
func sanitize(_ text: String) -> String {
    let allowedCharacters = CharacterSet.alphanumerics
    return text.unicodeScalars.filter { allowedCharacters.contains($0) }.map { Character($0) }.joined().lowercased()
}

// Function to check if the sanitized text is a palindrome
func isPalindrome(_ text: String) -> Bool {
    let sanitized = sanitize(text)
    return sanitized == String(sanitized.reversed())
}

// Main Program
print("Palindrome Checker")

print("Enter a text to check if it's a palindrome:")
guard let inputText = readLine(),
      !inputText.trimmingCharacters(in: .whitespaces).isEmpty else {
    print("No text entered.")
    exit(1)
}

if isPalindrome(inputText) {
    print("\"\(inputText)\" is a palindrome.")
} else {
    print("\"\(inputText)\" is not a palindrome.")
}

