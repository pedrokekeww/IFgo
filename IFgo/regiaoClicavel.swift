//
//  regiaoClicavel.swift
//  IFgo
//
//  Created by found on 15/07/25.
//
//

import SwiftUI

struct regiaoClicavel: View{
    @State var goToAndar = false
    var body: some View{
        // Navigation view a fim de preparar o navigation link
        NavigationStack{
            // Empilhamento da imagem do mapa com os botões que serão posicionados
            ZStack(alignment: .leading) {
                Image("1")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                    .border(.black)
                ZStack(alignment: .leading){
                    Color(.blue)
                }
            // Estilização do botão, manipulavel e modular
                .padding()
                .buttonStyle(.borderedProminent)
                .offset(x: 40, y: -50)
                .opacity(0.1)
                .frame(maxWidth: 110, maxHeight: 150)
                .onTapGesture {
                    print("Bia")
                    goToAndar = true
                }
                
                
            }
            .navigationDestination(isPresented: $goToAndar) {
                TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "2"))
            }
        }
    }
}
#Preview {
    regiaoClicavel()
}

