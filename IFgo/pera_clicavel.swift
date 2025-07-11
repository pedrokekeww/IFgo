//
//  pera_clicavel.swift
//  IFgo
//
//  Created by found on 11/07/25.
//

import SwiftUI

struct regiaoClicavel: View{
    var body: some View{
        NavigationView{
            ZStack(alignment: .leading) {
                Image("3")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                    .border(.red)
                NavigationLink(destination: TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "1"))) {
                    Text("               ")
                }
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
    peraClicavel()
}

