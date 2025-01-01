//
//  GoalDetailView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/28/24.
//
import SwiftUI

struct GoalDetailView: View {
    var goal: Goal
    
    init(goal: Goal) {
        self.goal = goal
    }
    
    var body: some View {
        Text("Goal Details")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
      
    
        
        List {
            Section("Goal Title") {
                Text("\(goal.title)")
            }
            Section("Goal Details") {
                Text("\(goal.details ?? "")")
            }
            Section("Due Date") {
                Text("\(goal.dueDate.formatted(date: .long, time: .omitted))")
                Text("\(goal.daysRemaining) Days Remaining")
            }
            Section("Type") {
                Label {
                    Text("\(goal.goalType.capitalized) Term Goal")
                 } icon: {
                        Image(systemName: "flag.fill")
                         .foregroundStyle(goal.color)
                    }
                
            }
            
        }
        Spacer()
    }
}

#Preview {
    GoalDetailView(goal: Goal(title: "Test Goal", details: nil, goalType: .short, dueDate: Date(), isCompleted: false))
        .environmentObject(GoalsManager())

}
