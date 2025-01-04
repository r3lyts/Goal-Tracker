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
        
    }
}
    
    



#Preview {
    MainView()
        .modelContainer(for: Goal.self)
}
