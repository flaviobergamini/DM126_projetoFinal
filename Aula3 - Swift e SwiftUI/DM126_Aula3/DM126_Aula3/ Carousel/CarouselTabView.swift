//
//  CarouselTabView.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI
import PhotosUI

struct CarouselTabView: View {
    @State private var bannerList: [ServiceType] = [
        ServiceType(id: 1, nome: "", imagem: "c1"),
        ServiceType(id: 2, nome: "", imagem: "c2"),
        ServiceType(id: 3, nome: "", imagem: "c3"),
    ]
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var isLoading = false
    private let apiService = APIService()
    
    var body: some View {
        VStack {
            TabView {
                ForEach(bannerList) { banner in
                    CarouselItemView(banner: banner)
                }
            }
            .frame(width: 300)
            .tabViewStyle(.page(indexDisplayMode: .always))

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Text("Selecionar Imagem")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top)
            .onChange(of: selectedItem) { newItem in
                if let newItem = newItem {
                    loadImage(from: newItem)
                }
            }
            
            if isLoading {
                ProgressView("Carregando...")
                    .padding()
            }
        }
    }
    
    private func loadImage(from item: PhotosPickerItem) {
        isLoading = true
        
        item.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let data):
                    if let data = data {
                        uploadImage(data: data)
                    }
                case .failure(let error):
                    print("Erro ao carregar imagem: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func uploadImage(data: Data) {
        isLoading = true
        
        guard let imageBase64 = UIImage(data: data)?.jpegData(compressionQuality: 0.8)?.base64EncodedString() else {
            print("Erro ao processar imagem.")
            isLoading = false
            return
        }
        
        apiService.postImage(imageURL: imageBase64) { response, error in
            DispatchQueue.main.async {
                isLoading = false
                
                if let error = error {
                    print("Erro ao fazer upload: \(error.localizedDescription)")
                } else if let jsonResponse = response as? [String: Any], let imageURL = jsonResponse["image"] as? String {
                    print(imageURL)
                    // Obs: Devido ao tempo de acesso no MAC remoto, a imagem da API está local, mas a requisição POST funciona
                    // TODO: Ficou pendende os métodos de download da imagem da API e armazenameno na pasta Assets do projeto
                    let newBanner = ServiceType(id: bannerList.count + 1, nome: "", imagem: "Prologica")
                    bannerList.append(newBanner)
                } else {
                    print("Erro: Resposta inválida ou chave 'image' não encontrada.")
                }
            }
        }
    }
}

#Preview {
    CarouselTabView()
}
