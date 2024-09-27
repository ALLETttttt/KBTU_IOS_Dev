import Foundation


// Student Class
class Student {
    let name: String
    let score: Double
    
    init(name: String, score: Double) {
        self.name = name
        self.score = score
    }
}

// Grade Calculator Class
class GradeCalculator {
    private var students: [Student] = []
    
    func addStudent(name: String, score: Double) {
        let student = Student(name: name, score: score)
        students.append(student)
    }
    
    func calculateAverage() -> Double {
        let total = students.reduce(0) { $0 + $1.score }
        return students.isEmpty ? 0.0 : total / Double(students.count)
    }
    
    func highestScore() -> Double? {
        return students.map { $0.score }.max()
    }
    
    func lowestScore() -> Double? {
        return students.map { $0.score }.min()
    }
    
    func generateReport() {
        let average = calculateAverage()
        guard let highest = highestScore(), let lowest = lowestScore() else {
            print("No student data available.")
            return
        }
        
        print("\n--- Grade Report ---")
        for student in students {
            let status = student.score >= average ? "Above Average" : "Below Average"
            print("\(student.name): \(student.score) - \(status)")
        }
        print("\nAverage Score: \(average)")
        print("Highest Score: \(highest)")
        print("Lowest Score: \(lowest)")
    }
}

// Main Program
let gradeCalculator = GradeCalculator()

print("Grade Calculator")
print("Enter student names and their scores.")
print("Type 'done' when finished.")

while true {
    print("\nEnter student name (or 'done' to finish):", terminator: " ")
    guard let nameInput = readLine(), !nameInput.trimmingCharacters(in: .whitespaces).isEmpty else {
        print("Invalid name. Please try again.")
        continue
    }
    
    if nameInput.lowercased() == "done" {
        break
    }
    
    print("Enter score for \(nameInput):", terminator: " ")
    guard let scoreInput = readLine(),
          let score = Double(scoreInput),
          (0...100).contains(score) else {
        print("Invalid score. Please enter a number between 0 and 100.")
        continue
    }
    
    gradeCalculator.addStudent(name: nameInput.trimmingCharacters(in: .whitespaces), score: score)
}

if gradeCalculator.calculateAverage() == 0 && gradeCalculator.highestScore() == nil {
    print("No student data entered.")
} else {
    gradeCalculator.generateReport()
}

