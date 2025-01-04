//
//  GoalsView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/27/24.
//

import SwiftUI
import SwiftData

struct GoalsView: View {
    @Query var goals: [Goal]
    
    var body: some View {
        NavigationStack {
            List(goals) { goal in
                NavigationLink {
                    GoalDetailView(goal: goal)
                } label: {
                    HStack {
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

#Preview {
    GoalsView()
        .modelContainer(for: Goal.self, inMemory: true)
}
