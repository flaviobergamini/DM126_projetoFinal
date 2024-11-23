//
//  ContentView.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    private var service = APIService()
    @State private var APIGoals: [GoalType] = []
    @State private var isLoading: Bool = true

    var body: some View {
        VStack {
            if isLoading {
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0, anchor: .center)
            } else {
                VStack {
                    NavigationBar()
                    Divider()
                    ScrollView {
                        VStack(spacing: 30) {
                            FeatureGrid()
                            CarouselTabView().frame(height: 300)
                            GoalContainer(goals: APIGoals)
                        }
                    }
                }
            }
        }
        .onAppear {
            getGoalsAF()
        }
        .padding()
    }

    func getGoalsAF() {
        service.getGoals { goals, error in
            if let goals = goals {
                self.APIGoals = goals
            }
            self.isLoading = false
        }
    }
}

