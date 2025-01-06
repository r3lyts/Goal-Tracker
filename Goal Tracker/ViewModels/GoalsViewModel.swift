//
//  GoalsViewModel.swift
//  Goal Tracker
//
//  Created by Tyler Small on 1/3/25.
//
import SwiftData
import SwiftUI

class GoalsViewModel {
    
    
    func deleteGoals(at offsets: IndexSet, from goals: [Goal], using context: ModelContext) {
            for index in offsets {
                let goal = goals[index]
                context.delete(goal)
            }
            
            do {
                try context.save()
                print("Goal deleted successfully")
            } catch {
                print("Failed to delete goal: \(error)")
            }
        }
    }
