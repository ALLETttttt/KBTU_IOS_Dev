// Easy #1
let fruits: Array = [
"friut1", "friut2", "friut3", "friut4", "friut5"
]
print(fruits[2])

// Easy #2
var numbers: Set = [1, 2, 3, 4, 5]
numbers.insert(6)
print(numbers)

//Easy #3
let languagesReleaseYears = ["Python": 1991, "Java": 1995, "Swift": 2014]
let swiftReleaseYear = languagesReleaseYears["Swft"] ?? 0
print(swiftReleaseYear)

// Easy #4
var colorsArray: Array = [
"blue", "black", "white", "green"
]

print(colorsArray)
colorsArray[1] = "true Black"
print(colorsArray)

// Medium #1
let firstSet: Set = [1, 2, 3, 4]
let secondSet: Set = [3, 4, 5, 6]

let firstAndSecondSet = firstSet.intersection(secondSet)
print(firstAndSecondSet)

// Medium #2
var dictionary = [
"Bakdaulet": 5, "Didar": 8, "Yerdaulet": 6
]

print(dictionary)
dictionary.updateValue(8, forKey: "Bakdaulet")
print(dictionary)

// Medium #3
let firstArray = ["apple", "banana"]
let secondArray = ["cherry", "date"]
let mergedArray = firstArray + secondArray
print(mergedArray)

// Hard #1
var countryPopulations = ["Kazakhstan": 19_000_000, "Russia": 144_000_000, "China": 1_398_000_000]

countryPopulations["Japan"] = 126_000_000

print(countryPopulations)

// Hard #2
let animals1 : Set = ["dog", "cat"]
let animals2: Set = ["dog", "mouse"]
let unitedAnimals = animals1.union(animals2)
print(unitedAnimals)
let result = unitedAnimals.subtracting(animals2)
print(result)

// Hard #3
var studentGrades = [
    "Bakdaulet": [85, 90, 88],
    "Yearsyl": [78, 82, 91],
    "Ersultan": [92, 88, 79]
]

let secondGradeOfStudent = studentGrades["Bakdaulet"]?[1] ?? 0
print(secondGradeOfStudent)



