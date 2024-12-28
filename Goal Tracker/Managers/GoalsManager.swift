//
//  GoalsManager.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/28/24.
//
import Foundation

class GoalsManager: ObservableObject {
    @Published var goals: [Goal] = []
}
