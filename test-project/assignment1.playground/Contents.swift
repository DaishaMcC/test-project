import Foundation

// Array of student names
let studentNames: [String] = ["Alice", "Bob", "Charlie", "Diana", "Ethan"]

// Dictionary mapping student names to their grades
var studentGrades: [String: [Int]] = [
    "Alice": [85, 90, 78],
    "Bob": [92, 88, 95],
    "Charlie": [70, 75, 80],
    "Diana": [88, 84, 91],
    "Ethan": [60, 65, 58]
]

// Print summary
print("Student Record Summary:")

for name in studentNames {
    if let grades = studentGrades[name] {
        // Calculate average
        let total = grades.reduce(0, +)
        let average = Double(total) / Double(grades.count)
        
        // Print details
        print("\nStudent: \(name)")
        print("Grades: \(grades)")
        print("Average: \(String(format: "%.2f", average))")
    } else {
        print("\nStudent: \(name)")
        print("No grades available.")
    }
}
