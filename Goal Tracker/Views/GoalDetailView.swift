//
//  GoalDetailView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/28/24.
//
import SwiftUI

struct GoalDetailView: View {
    let goal: Goal
    init(goal: Goal) {
        self.goal = goal
    }
    
    var body: some View {
        Text("Goal Details")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        Text("Title: \(goal.title)")
        Text("Details: \(goal.details ?? "")")
        Text("Due Date: \(goal.dueDate)")
        Text("Goal Type: \(goal.goalType)")
        Spacer()
    }
}

#Preview {
    GoalDetailView(goal: Goal(title: "Test Goal", details: nil, goalType: .short, dueDate: Date(), isCompleted: false))
        .environmentObject(GoalsManager())

}
