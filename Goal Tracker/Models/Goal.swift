//
//  Goal.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/26/24.
//
import Foundation
import SwiftData
import SwiftUI

enum GoalType: String {
    case short
    case medium
    case long
}

@Model
class Goal: Identifiable {
    // Properties
    var title: String
    var details: String = ""
    var goalType: String
    var dueDate: Date
    var isCompleted: Bool = false
    
    //Initializer
    init(title: String, details: String, goalType: GoalType, dueDate: Date, isCompleted: Bool = false) {
        self.title = title
        self.details = details
        self.goalType = goalType.rawValue
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
    
    //Finds the days remaining until the due date.
    var daysRemaining: Int {
        let calendar = Calendar.current
        let currentDate = Date()
        guard let days = calendar.dateComponents([.day], from: currentDate, to: dueDate).day else {
            return 0
        }
        return max(days, 0) //If past due (negative), only returns 0 as no days are remaining
    }
    
    var type: GoalType {
        get { GoalType(rawValue: goalType) ?? .short }  // Provide a default value
        set { goalType = newValue.rawValue }
    }
    
    var color: Color {
        switch type {
            case .short:
                return .red
            case .medium:
                return .orange
            case .long:
                return .blue
        }
    }
}
