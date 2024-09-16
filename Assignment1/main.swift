var firstName: String = "Bakdaulet"
var lastName: String = "Alaidar"
var age: Int = 20
let birthYear: Int = 2004
let currentYear: Int = 2024
let isStudent: Bool = true
var height: Double = 1.82

age = currentYear - birthYear

var favoriteColor: String = "Blue"
var lovesTraveling: Bool = true

var hobby: String = "Playing football"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 7
var isHobbyCreative: Bool = true

var favoriteSport: String = "Football"
var likesReading: Bool = true

var lifeStory: String = "My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently a \(isStudent ? "student" : "professional"). My height is \(height) meters. I enjoy \(hobby), which is \(isHobbyCreative ? "a creative hobby" : "not a creative hobby"). I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber)."

print(lifeStory)

var futureGoals: String = "In the future, I want to become an iOS developer."
lifeStory += " \(futureGoals) 🚀"

print(lifeStory)
