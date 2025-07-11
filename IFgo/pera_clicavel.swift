//
//  regiaoClicavel.swift
//  IFgo
//
//  Created by found on 11/07/25.
//

import SwiftUI

struct regiaoClicavel: View{
    var body: some View{
        // Navigation view a fim de preparar o navigation link
        NavigationView{
            // Empilhamento da imagem do mapa com os botões que serão posicionados
            ZStack(alignment: .leading) {
                Image("3")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                    .border(.black)
                NavigationLink(destination: TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "1"))) {
                    Text("               ")
                }
            // Estilização do botão, manipulavel e modular
                .padding()
                .buttonStyle(.borderedProminent)
                .rotationEffect(Angle(degrees: 270.0))
                .offset(x: 20, y: -10)
                .opacity(0.3)
                .controlSize(ControlSize.regular)
                
                
            }
        }
    }
}
#Preview {
    regiaoClicavel()
}
