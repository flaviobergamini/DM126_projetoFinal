//
//  AddUserView.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var usuarios: [String]
    @State private var novoNomeUsuario: String = ""

    var body: some View {
        VStack {
            Text("Adicionar Novo Usuário")
                .font(.headline)
            TextField("Nome do usuário", text: $novoNomeUsuario)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Salvar") {
                if !novoNomeUsuario.isEmpty {
                    usuarios.append(novoNomeUsuario)
                    dismiss()
                }
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    @State var usuariosExemplo = ["Flavio Bergamini"]

       
            AddUserView(usuarios: $usuariosExemplo)
    //AddUserView(usuarios: ["Flavio Bergamini"])
}
