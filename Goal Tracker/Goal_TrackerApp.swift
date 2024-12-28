//
//  Goal_TrackerApp.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/25/24.
//

import SwiftUI
import SwiftData
import Foundation

@main
struct Goal_TrackerApp: App {
    let container = try! ModelContainer(for: Goal.self)
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    preloadData(modelContext: container.mainContext)
                }
        }
        .modelContainer(container)
        
    }
    func preloadData(modelContext: ModelContext) {
        // Create short-term goals
        let shortGoal1 = Goal(
            title: "Complete SwiftUI Tutorial",
            details: "Finish the Apple SwiftUI Essentials tutorial",
            goalType: .short,
            dueDate: Date().addingTimeInterval(7 * 24 * 3600) // 7 days from now
        )
        
        let shortGoal2 = Goal(
            title: "Setup Development Environment",
            details: "Install Xcode and necessary tools",
            goalType: .short,
            dueDate: Date().addingTimeInterval(3 * 24 * 3600) // 3 days from now
        )
        
        // Create medium-term goals
        let mediumGoal = Goal(
            title: "Launch MVP",
            details: "Complete and launch the minimum viable product",
            goalType: .medium,
            dueDate: Date().addingTimeInterval(30 * 24 * 3600) // 30 days from now
        )
        
        // Create long-term goals
        let longGoal = Goal(
            title: "Learn Swift Backend Development",
            details: "Master server-side Swift using Vapor",
            goalType: .long,
            dueDate: Date().addingTimeInterval(180 * 24 * 3600) // 180 days from now
        )
        
        // Insert all goals into the context
        modelContext.insert(shortGoal1)
        modelContext.insert(shortGoal2)
        modelContext.insert(mediumGoal)
        modelContext.insert(longGoal)
        
        // You can try to save the context here if you want
        try? modelContext.save()
    }
}
