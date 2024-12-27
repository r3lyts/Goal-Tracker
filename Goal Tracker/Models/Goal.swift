//
//  Goal.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/26/24.
//
import Foundation

enum GoalType: String, Codable {
    case short
    case medium
    case long
}

struct Goal: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String?
    let goalType: GoalType
    let dueDate: Date
    let completed: Bool
}
