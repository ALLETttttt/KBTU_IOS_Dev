
import Foundation

enum TemperatureUnit: String {
    case celsius = "C"
    case fahrenheit = "F"
    case kelvin = "K"
}

typealias ConversionFunction = (Double) -> Double

let conversionMap: [TemperatureUnit: [TemperatureUnit: ConversionFunction]] = [
    .celsius: [
        .fahrenheit: { ($0 * 9/5) + 32 },
        .kelvin: { $0 + 273.15 }
    ],
    .fahrenheit: [
        .celsius: { ($0 - 32) * 5/9 },
        .kelvin: { ($0 - 32) * 5/9 + 273.15 }
    ],
    .kelvin: [
        .celsius: { $0 - 273.15 },
        .fahrenheit: { ($0 - 273.15) * 9/5 + 32 }
    ]
]

// Main Program
print("Temperature Converter")

// Function to get user input with prompt
func getInput(prompt: String) -> String? {
    print(prompt, terminator: " ")
    return readLine()
}

guard let tempInput = getInput(prompt: "Enter temperature value:"), let tempValue = Double(tempInput) else {
    print("Invalid temperature value.")
    exit(1)
}

guard let unitInput = getInput(prompt: "Enter unit (C, F, K):")?.uppercased(),
      let unit = TemperatureUnit(rawValue: unitInput) else {
    print("Invalid temperature unit.")
    exit(1)
}

if let conversions = conversionMap[unit] {
    for (targetUnit, convert) in conversions {
        let convertedValue = convert(tempValue)
        print("\(tempValue)\(unit.rawValue) is \(String(format: "%.2f", convertedValue))\(targetUnit.rawValue)")
    }
} else {
    print("Conversion not possible for the given unit.")
}
