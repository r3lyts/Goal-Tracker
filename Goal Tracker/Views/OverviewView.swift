//
//  OverviewView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/26/24.
//
import SwiftUI
import SwiftData

struct OverviewView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var goals: [Goal]

    var body: some View {
        
        VStack {
            VStack {
                Text(Date().formatted(.dateTime.month(.abbreviated).day().year()))
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                Text("Overview")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
            Button("Reset Database") {
               resetDatabase(modelContext: modelContext)
            }
            Button("Print Database Contents") {
                for goal in goals {
                    print("Goal: \(goal)") // This will print the description of each goal
                }
            }
            
            Spacer()
        }
    }
    
    func resetDatabase(modelContext: ModelContext) {
        do {
            let fetchDescriptor = FetchDescriptor<Goal>()
            let items = try modelContext.fetch(fetchDescriptor)
            
            for item in items {
                modelContext.delete(item)
            }
            try modelContext.save()
        } catch {
            print("Error resetting database: \(error)")
        }
    }
}

#Preview {
    OverviewView()
}

