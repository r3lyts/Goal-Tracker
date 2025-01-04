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
    @StateObject private var addGoalViewModel = AddGoalViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section("Title") {
                        TextField("Goal Title", text: $addGoalViewModel.goalTitle)
                    }
                    Section("Description") {
                        TextField("Description", text: $addGoalViewModel.goalDescription)
                    }
                    Section("Due Date") {
                        DatePicker(
                            "",
                            selection: $addGoalViewModel.goalDueDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .onChange(of: addGoalViewModel.goalDueDate) {
                            addGoalViewModel.updateGoalType()
                        }
                    }
                    Section("Type") {                       
                        Text("\(addGoalViewModel.goalType.rawValue.capitalized) Term Goal")
                            
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
