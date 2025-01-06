//
//  GoalDetailView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/28/24.
//
import SwiftUI

struct GoalDetailView: View {
    var goal: Goal
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section("Goal Title") {
                        Text("\(goal.title)")
                    }
                    Section("Goal Details") {
                        Text("\(goal.details)")
                    }
                    Section("Due Date") {
                        Text("\(goal.dueDate.formatted(date: .long, time: .omitted))")
                        Text("\(goal.daysRemaining) Days Remaining")
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
                .navigationTitle("Goal Details")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: EditGoalView(goal: goal)) {
                            Text("Edit Goal")
                        }
                    }
                }
            }
        }
        Spacer()
    }
}


