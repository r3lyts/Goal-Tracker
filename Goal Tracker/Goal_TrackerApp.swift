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
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Goal.self])
        }
        
    }
   
}
