
import Foundation



var shoppingList: [String: Int] = [:]

// Function to display the menu using a function with parameters
func displayMenu() {
    print("""
    
    Shopping List Manager
    ---------------------
    1. Add Item
    2. Remove Item
    3. View Shopping List
    4. Clear Shopping List
    5. Exit
    Enter your choice:
    """)
}

// Function to add an item with quantity
func addItem() {
    guard let item = readLine(prompt: "Enter the item to add:")?.lowercased(),
          !item.isEmpty else {
        print("Invalid item.")
        return
    }
    guard let quantityInput = readLine(prompt: "Enter quantity for \(item):"),
          let quantity = Int(quantityInput), quantity > 0 else {
        print("Invalid quantity. Please enter a positive integer.")
        return
    }
    shoppingList[item, default: 0] += quantity
    print("Added \(quantity) x \(item) to the shopping list.")
}

// Function to remove an item
func removeItem() {
    guard !shoppingList.isEmpty else {
        print("Shopping list is empty. Nothing to remove.")
        return
    }
    guard let item = readLine(prompt: "Enter the item to remove:")?.lowercased(),
          let currentQuantity = shoppingList[item] else {
        print("Item not found in the shopping list.")
        return
    }
    print("Current quantity of \(item): \(currentQuantity)")
    guard let quantityInput = readLine(prompt: "Enter quantity to remove:"),
          let quantity = Int(quantityInput), quantity > 0 else {
        print("Invalid quantity.")
        return
    }
    if quantity >= currentQuantity {
        shoppingList.removeValue(forKey: item)
        print("Removed \(item) from the shopping list.")
    } else {
        shoppingList[item] = currentQuantity - quantity
        print("Decreased \(item) quantity by \(quantity). New quantity: \(shoppingList[item]!)")
    }
}

// Function to view the shopping list
func viewList() {
    if shoppingList.isEmpty {
        print("Shopping list is empty.")
    } else {
        print("\nCurrent Shopping List:")
        for (item, quantity) in shoppingList.sorted(by: { $0.key < $1.key }) {
            print("- \(item.capitalized): \(quantity)")
        }
    }
}

// Function to clear the shopping list
func clearList() {
    shoppingList.removeAll()
    print("Shopping list has been cleared.")
}

// Extension to read input with a prompt
extension String {
    static func readLine(prompt: String) -> String? {
        print(prompt, terminator: " ")
        return readLine()
    }
}

// Main Program Loop
while true {
    displayMenu()
    guard let choice = readLine(),
          let option = Int(choice) else {
        print("Invalid choice. Please enter a number between 1 and 5.")
        continue
    }
    
    switch option {
    case 1:
        addItem()
    case 2:
        removeItem()
    case 3:
        viewList()
    case 4:
        clearList()
    case 5:
        print("Exiting Shopping List Manager. Goodbye!")
        exit(0)
    default:
        print("Invalid choice. Please select a valid option.")
    }
}
