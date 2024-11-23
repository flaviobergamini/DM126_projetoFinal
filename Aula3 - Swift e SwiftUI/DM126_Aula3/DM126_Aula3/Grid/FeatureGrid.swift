//
//  FeatureGrid.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct FeatureGrid: View {
    var gridLayout: [GridItem] {
        return Array(repeating:
                        GridItem(.flexible()), count: 2)
    }
    var body: some View {
        LazyHGrid(rows: gridLayout) {
            ForEach(serviceMock) {
                service in FeaturesType(service: service)
            }
        }.frame(height: 200)
            .padding(.horizontal,15)
            .padding(.top, 15)
    }
}

#Preview {
    FeatureGrid()
}
