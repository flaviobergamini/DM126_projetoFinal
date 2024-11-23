//
//  GoalContainer.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct GoalContainer: View {
    var goals: [GoalType]
    var body: some View {
        VStack(alignment: .leading,
               spacing: 30){
            ForEach(goals) {
                goal in GoalListView(goal: goal)
            }
        }
    }
}

#Preview {
    GoalContainer(goals: goalMock)
}
