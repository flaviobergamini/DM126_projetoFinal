//
//  CarouselItemView.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct CarouselItemView: View {
    var banner: ServiceType
    var body: some View {
        Image(banner.imagem)
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
    }
}

#Preview {
    CarouselItemView(banner: ServiceType(id:1, nome:"", imagem:"c1"))
}
