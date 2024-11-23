//
//  GoalListView.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct GoalListView: View {
    let goal: GoalType
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: goal.icone)
                .font(.largeTitle)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(goal.titulo).font(.headline)
                Text(goal.descricao).font(.subheadline)
            }
        }.foregroundStyle(.blue)
    }
}

#Preview {
    GoalListView(goal: GoalType(id: 3, icone: "goforward.60", titulo: "Redes sociais", descricao: "Usar o celular por apenas 1h"))
}
