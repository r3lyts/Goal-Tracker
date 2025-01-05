//
//  EditGoalView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/4/25.
//
import SwiftUI

struct GoalEditView: View {
    @State private var title: String
    @State private var details: String
    @State private var dueDate: Date
    @State private var goalType: String
    var addGoalViewModel: AddGoalViewModel
    
    var goal: Goal
    
    init(goal: Goal) {
        self.goal = goal
        _title = State(initialValue: goal.title)
        _details = State(initialValue: goal.details)
        _dueDate = State(initialValue: goal.dueDate)
        _goalType = State(initialValue: goal.type.rawValue)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section("Goal Title") {
                        TextField("\(goal.title)", text: $title)
                    }
                    Section("Goal Details") {
                        TextField("\(goal.details)", text: $details)
                    }
                    Section("Due Date") {
                        DatePicker(
                            "",
                            selection: $dueDate,
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
                            Text("\(goal.type.rawValue.capitalized) Term Goal")
                        } icon: {
                            Image(systemName: "flag.fill")
                                .foregroundStyle(goal.type.color)
                        }
                    }
                }
                .navigationTitle("Edit Goal")
                
            }
        }
        Spacer()
    }
}


