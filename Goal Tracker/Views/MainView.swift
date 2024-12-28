//
//  MainView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/27/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView {
            OverviewView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Overview")
                }
            
            GoalsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Goals")
                }
            
            InsightsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Insights")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .onAppear {
            print("MainView appeared")
            loadInitialDataIfNeeded()
        }
    }
    
    //Loads test data
    private func loadInitialDataIfNeeded() {
        // Check if we already have any goals
        let descriptor = FetchDescriptor<Goal>()
        let existingGoals = try? modelContext.fetch(descriptor)
        
        if existingGoals?.isEmpty ?? true {
            print("No existing goals found, loading test data...")
            // Your existing preloadData logic here
            let shortGoal1 = Goal(
                title: "Complete SwiftUI Tutorial",
                details: "Finish the Apple SwiftUI Essentials tutorial",
                goalType: .short,
                dueDate: Date().addingTimeInterval(7 * 24 * 3600)
            )
            
            // Add more goals...
            let shortGoal2 = Goal(
                title: "Setup Development Environment Where everything is going to work and install necessary tools",
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
            
            modelContext.insert(shortGoal1)
            modelContext.insert(shortGoal2)
            modelContext.insert(mediumGoal)
            modelContext.insert(longGoal)
            try? modelContext.save()
            print("Test data loaded")
        } else {
            print("Found \(existingGoals?.count ?? 0) existing goals")
        }
    }
}


#Preview {
    MainView()
        .modelContainer(for: Goal.self, inMemory: true)
}
