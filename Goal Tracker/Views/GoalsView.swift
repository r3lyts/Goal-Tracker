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
        VStack {
            NavigationStack {
                List(goals) { goal in
                    NavigationLink(destination: GoalDetailView()) {
                        VStack(alignment: .leading) {
                            Text(goal.title)
                                .font(.headline)
                            Text("\(goal.dueDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption2)
                                .foregroundColor(.gray)
                            Text("\(goal.type)")
                                .font(.caption)
                                .foregroundStyle(goal.color)
                            
                        }
                    }
                }
                .onAppear {
                    print("Number: \(goals.count)")
                }
                .navigationTitle("Goals")
                Spacer()
                
            }
        }
        
    }
}

#Preview {
    GoalsView()
        .modelContainer(for: Goal.self, inMemory: true)
}
