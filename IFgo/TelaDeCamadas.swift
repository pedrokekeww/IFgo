//
//  sistemaDeCamadas.swift
//  IFgo
//
//  Created by found on 04/07/25.
//

struct Andar: Identifiable{
    let id = UUID()
    
    init(nomeDaImagem: String){
        self.imagem = nomeDaImagem
    }
    
    var imagem: String
}

import SwiftUI

struct TelaDeCamadas: View{
    var andares: [Andar] = [Andar(nomeDaImagem: "2"), Andar(nomeDaImagem: "1")]
    @State var imagemAtual: String
    
    var body: some View {
        ZStack{
            ForEach(andares){ andar in
                Image(andar.imagem)
            }
        }
    }
    
}

#Preview{
    TelaDeCamadas(imagemAtual: "1")
}
