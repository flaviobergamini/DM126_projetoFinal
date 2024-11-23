//
//  FeaturesType.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct FeaturesType: View {
    let service: ServiceType
    var body: some View {
        VStack{
            Image(service.imagem)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .fixedSize(horizontal: false, vertical: true)
            Text(service.nome)
        }.frame(width: 80.0, height: 80.0)
    }
}

#Preview {
    FeaturesType(service: ServiceType(id: 1, nome: "Exercitar", imagem:"1"))
}
