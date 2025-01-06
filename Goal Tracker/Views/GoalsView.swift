//
//  GoalsView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/27/24.
//

import SwiftUI
import SwiftData

struct GoalsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var goals: [Goal]
    private let goalsViewModel = GoalsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(goals) { goal in
                    GoalRowView(goal: goal)
                }
                .onDelete { offsets in
                    goalsViewModel.deleteGoals(at: offsets, from: goals, using: modelContext)
                }
                
                
            }
            .navigationTitle("Goals")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddGoalView()) {
                        Text("Add Goal")
                    }
                }
            }
    
            Spacer()
        }
    }
    
    
}

/**
 Combines the GoalIconView and GoalInfoView into a unified view with navigation to the GoalDetailView
 */
struct GoalRowView: View {
    let goal: Goal
    var body: some View {
        NavigationLink {
            GoalDetailView(goal: goal)
        } label: {
            HStack {
                GoalIconView(goal: goal)
                GoalInfoView(goal: goal)
                Spacer()
            }
        }
    }
}
/**
 Displays the Goal Icon on each row on the goal view
 */
struct GoalIconView: View {
    let goal: Goal
    
    var body: some View {
        Image(systemName: "flag.fill")
            .foregroundStyle(goal.color)
            .font(.title2)
            .frame(width: 42, height: 42)
            .background(Color(.systemGray6))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(goal.color, lineWidth: 1)
            )
            .shadow(radius: 1)
            .padding(.trailing, 8)
    }
}

/**
 Displays the text info for each goal in the goal view
 */
struct GoalInfoView: View {
    let goal: Goal
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(goal.title)
                .font(.headline)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Text("\(goal.dueDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        Spacer()
    }
}


#Preview {
    GoalsView()
        .modelContainer(for: Goal.self, inMemory: true)
}
