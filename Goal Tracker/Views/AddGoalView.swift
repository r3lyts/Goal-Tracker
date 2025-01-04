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
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var addGoalViewModel = AddGoalViewModel()
    
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
                            in: Date()..., // allows date to be picked from current day forward
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .onChange(of: addGoalViewModel.goalDueDate) {
                            addGoalViewModel.updateGoalType()
                        }
                    }
                    Section("Type") {
                        Label {
                            Text("\(addGoalViewModel.goalType.rawValue.capitalized) Term Goal")
                        } icon: {
                            Image(systemName: "flag.fill")
                                .foregroundStyle(addGoalViewModel.goalType.color)
                        }
                            
                    }
                }
                .navigationTitle("Add Goal")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save Goal") {
                            addGoalViewModel.saveGoal(using: modelContext)
                            dismiss()
                        }
                        .disabled(!addGoalViewModel.isTitleValid) //button is disable if there is no title
                    }
                }
                
            }
        }
    }
}

#Preview {
    AddGoalView()
}
