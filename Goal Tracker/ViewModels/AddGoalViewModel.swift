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

@Observable class AddGoalViewModel {
    
    var goalTitle: String = ""
    var goalDescription: String = ""
    var goalDueDate: Date = Date()
    var goalType: GoalType = .short
    var startDate: Date = Date()
    var isGoalComplete: Bool = false
    
    var color: Color {
        goalType.color
    }
    
    //Ensures title is not blank
    var isTitleValid: Bool {
        !goalTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    
    //Calculates the goal type based on day give
    //90 days <= short, 365 days <- medium, long everything else
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
//    func saveGoal(using context: ModelContext) {
//        let goal = Goal(
//            title: goalTitle,
//            details: goalDescription,
//            goalType: goalType,
//            dueDate: goalDueDate,
//            startDate: startDate,
//            isCompleted: isGoalComplete
//        )
//        context.insert(goal)
//
//        do {
//            try context.save()
//            print("Goal saved successfully")
//        } catch {
//            print("Failed to save goal: \(error)")
//        }
//        
//    }
    
    func saveGoal(using context: ModelContext) {
        print("=== SAVE ATTEMPT STARTED ===")
        
        // 1. First verify the ModelContext
        print("ModelContext state: \(context)")
        
        // 2. Print all input values
        print("""
        Input values:
        - Title: '\(goalTitle)'
        - Description: '\(goalDescription)'
        - Goal Type: \(goalType.rawValue)
        - Due Date: \(goalDueDate)
        - Start Date: \(startDate)
        - Is Complete: \(isGoalComplete)
        """)
        
        // 3. Create goal and verify its state
        let goal = Goal(
            title: goalTitle,
            details: goalDescription,
            goalType: goalType,
            dueDate: goalDueDate,
            startDate: startDate,
            isCompleted: isGoalComplete
        )
        
        print("Goal created with title: \(goal.title) and type: \(goal.goalType)")
        
        // 4. Check database before insert
        do {
            let preCount = try context.fetch(FetchDescriptor<Goal>()).count
            print("Goals in database before insert: \(preCount)")
            
            // 5. Insert and save
            context.insert(goal)
            try context.save()
            
            // 6. Verify after save
            let postCount = try context.fetch(FetchDescriptor<Goal>()).count
            print("Goals in database after save: \(postCount)")
            
            // 7. Print all goals
            let allGoals = try context.fetch(FetchDescriptor<Goal>())
            print("\nAll goals in database:")
            allGoals.forEach { goal in
                print("- \(goal.title) (Type: \(goal.goalType))")
            }
            
        } catch {
            print("❌ Error: \(error)")
            print("Detailed error: \(error.localizedDescription)")
        }
        
        print("=== SAVE ATTEMPT COMPLETED ===")
    }
    
    
    
    
}
