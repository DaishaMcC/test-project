//
//  SwiftUIView.swift
//  103-project
//
//  Created by Daisha McCutcheon on 12/10/25.
//

import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    var name: String
    var grades: [Double]
    
    var average: Double {
        grades.isEmpty ? 0.0 : grades.reduce(0, +) / Double(grades.count)
    }
}

struct StudentListView: View {
    
    @State private var students: [Student] = [
        Student(name: "Alice", grades: [80, 85, 88]),
        Student(name: "Bob", grades: [90, 92, 93]),
        Student(name: "Charlie", grades: [70, 75, 78])
    ]
    
    @State private var sortAscending: Bool = true
    
    var courseAverage: Double {
        let allGrades = students.flatMap { $0.grades }
        return allGrades.isEmpty ? 0.0 : allGrades.reduce(0, +) / Double(allGrades.count)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Course average summary
                Text("Course Average: \(courseAverage, specifier: "%.2f")")
                    .font(.title2)
                    .padding()
                
                Divider()
                
                // Student list
                List {
                    ForEach(sortedStudents) { student in
                        HStack {
                            Text(student.name)
                                .font(.headline)
                            Spacer()
                            Text("\(student.average, specifier: "%.2f")")
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Students")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sortAscending.toggle()
                    }) {
                        Image(systemName: sortAscending ? "arrow.up.circle" : "arrow.down.circle")
                            .imageScale(.large)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
    
    // Computed property for sorting
    var sortedStudents: [Student] {
        students.sorted {
            sortAscending ? $0.average < $1.average : $0.average > $1.average
        }
    }
}

#Preview {
    StudentListView()
}

