//
//  EditGoalView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/4/25.
//
import SwiftUI

struct EditGoalView: View {
    
    var goal: Goal
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var editGoalViewModel: EditGoalViewModel
    
    init(goal: Goal) {
        self.goal = goal
        self._editGoalViewModel = Bindable(EditGoalViewModel(goal: goal))
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section("Goal Title") {
                        TextField("\(editGoalViewModel.goalTitle)", text: $editGoalViewModel.goalTitle)
                    }
                    Section("Goal Details") {
                        TextField("\(editGoalViewModel.goalDetails)", text: $editGoalViewModel.goalDetails)
                    }
                    Section("Due Date") {
                        DatePicker(
                            "",
                            selection: $editGoalViewModel.goalDueDate,
                            in: Date()..., // allows date to be picked from current day forward
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .onChange(of: editGoalViewModel.goalDueDate) {
                            editGoalViewModel.updateGoalType()
                        }
                    }
                    Section("Type") {
                        Label {
                            Text("\(editGoalViewModel.goalType.rawValue.capitalized) Term Goal")
                        } icon: {
                            Image(systemName: "flag.fill")
                                .foregroundStyle(editGoalViewModel.goalType.color)
                        }
                            
                    }
                }
                .navigationTitle("Edit Goal")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save Goal") {
                            editGoalViewModel.updateGoal(using: modelContext)
                            dismiss()
                        }
                        .disabled(!editGoalViewModel.isTitleValid) //button is disable if there is no title
                    }
                }
                
            }
        }
        Spacer()
    }
}


