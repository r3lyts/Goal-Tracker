//
//  EditGoalViewModel.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/4/25.
//

//
//  AddGoalViewModel.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/3/25.
//
import Foundation
import SwiftData
import Observation
import SwiftUI

@Observable class EditGoalViewModel {
    
    var goalTitle: String = ""
    var goalDetails: String = ""
    var goalDueDate: Date = Date()
    var goalType: GoalType = .short
    var isGoalComplete: Bool = false
    
    var color: Color {
        goalType.color
    }
    
    //Ensures title is not blank
    var isTitleValid: Bool {
        !goalTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init(goal: Goal) {
        self.goalTitle = goal.title
        self.goalDetails = goal.details
        self.goalDueDate = goal.dueDate
        self.goalType = goal.type
        self.isGoalComplete = goal.isCompleted
    }
    
    
    //Calculates the goal type based on day give
    func calculateGoalType(for date: Date) -> GoalType {
        let calendar = Calendar.current
        let months = calendar.dateComponents([.month], from: Date(), to: date).month ?? 0
        
        if months < 6 { //short term goal is less than 6 months
            return .short
        }
        else if months < 36 { //medium term goal is less than 36 months
            return .medium
        }
        else {
            return .long
        }
    }
    
    func updateGoalType() {
        goalType = calculateGoalType(for: goalDueDate)
    }
    
    //saves goal to swiftdata
    //TODO: Modify to update instead of save?
    func updateGoal(using context: ModelContext) {
        
    }
    
    
    
    
}
