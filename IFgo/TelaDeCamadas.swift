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
    let andar: Andar = Andar(nomeDaImagem: "1")
}

import SwiftUI

struct TelaDeCamadas: View{
    var andares: [Andar] = [Andar(nomeDaImagem: "2"), Andar(nomeDaImagem: "1")]
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
            
//            ZStack{
//                ForEach(andares){ andar in
//                    Image(andar.nomeDaimagem)
//                }
//            }
        }
    }
    
}

#Preview{
    TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "2"))
}
