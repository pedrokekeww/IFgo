//
//  sistemaDeCamadas.swift
//  IFgo
//
//  Created by found on 04/07/25.
//


struct Andar: Identifiable, Hashable{
    let id = UUID()
    
    init(nomeDaImagem: String){
        
        self.nomeDaimagem = nomeDaImagem
    }
    
    var nomeDaimagem: String
}
struct example{
    let andar: Andar = Andar(nomeDaImagem: "2")
}

import SwiftUI

struct TelaDeCamadas: View{
    var andares: [Andar] =  [Andar(nomeDaImagem: "pera") ,Andar(nomeDaImagem: "2"), Andar(nomeDaImagem: "1")]
    @State var andarAtual: Andar = example().andar
    
    var body: some View {
        VStack{
            Picker("Primeiro Andar", selection:$andarAtual){
                ForEach(andares){
                    Text($0.nomeDaimagem)
                        .tag($0)
                }
            }
            
            Image(andarAtual.nomeDaimagem)
            
        }
    }
    
}

#Preview{
    TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "pera"))
}
