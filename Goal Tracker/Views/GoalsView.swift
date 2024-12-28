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
                    GoalDetailView()
                } label: {
                    HStack {
                        Text("") //THIS IS NEEDED BECAUSE DIVIDING LINE WILL NOT START AT BEGINNING WITHOUT IT???
                        Image(systemName: "flag.fill")
                            .foregroundStyle(goal.color)
                            .font(.title2)
                            .frame(width: 35, height: 35)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding(.trailing, 8)
                        VStack(alignment: .leading) {
                            Text(goal.title)
                                .font(.headline)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .padding(.bottom, 1)
                            Text("\(goal.dueDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
                
                
            }
            .navigationTitle("Goals")
            Spacer()
        }
    }
}

#Preview {
    GoalsView()
        .modelContainer(for: Goal.self, inMemory: true)
}
