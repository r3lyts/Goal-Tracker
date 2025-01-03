//
//  AddGoalView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/2/25.
//
import SwiftUI

//HANDLE ERRORS
// * goal title required
struct AddGoalView: View {
    @State private var goalTitle: String = ""
    @State private var goalDetails: String = ""
    var goalDueDate: Date = Date()
    var goalType: GoalType = .long
    var isComplete: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section("Title") {
                        TextField("Goal Title", text: $goalTitle)
                    }
                    Section("Description") {
                        TextField("Description", text: $goalDetails)
                    }
                    Section("Due Date") {
                        
                    }
                    Section("Type") {
                        
                    }
                }
                .navigationTitle("Add Goal")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("Save") //TODO: Actually save to database here
                        }) {
                            Text("Save Goal")
                        }
                    }
                }
            }
        }
       
        
        
    }
}

#Preview {
    AddGoalView()
}
