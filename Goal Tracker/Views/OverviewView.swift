//
//  OverviewView.swift
//  Goal Tracker
//
//  Created by Tyler Small on 12/26/24.
//
import SwiftUI

struct OverviewView: View {
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
            
            Spacer()
        }
    }
}

#Preview {
    OverviewView()
}

