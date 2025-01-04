//
//  AddGoalViewModel.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/3/25.
//
import Foundation

class AddGoalViewModel: ObservableObject {
    @Published var goalTitle: String = ""
    @Published var goalDescription: String = ""
    @Published var goalDueDate: Date = Date()
    @Published var goalType: GoalType = .short
    @Published var isGoalComplete: Bool = false
    
    //Calculates the goal type based on day give
    //90 days <= short, 365 days <- medium, long everything else
    func calculateGoalType(for date: Date) -> GoalType {
        let calendar = Calendar.current
        let days = calendar.dateComponents([.day], from: Date(), to: date).day ?? 0
        
        if days <= 90 {
            return .short
        }
        else if days <= 365 {
            return .medium
        }
        else {
            return .long
        }
    }
    
    func updateGoalType() {
        goalType = calculateGoalType(for: goalDueDate)
    }
    
    func saveGoal() {
        //TODO: handle saving goal logic here
    }
    
}
