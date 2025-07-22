//
//  frontViewBP.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI

// Aqui é puramente front-end/uso da struct do BotaoAndar que eu fiz antes
// Acredito que é auto-explicativo
struct FrontViewBP: View{
    // Pra deixar modular é só criar algumas variáveis
    @Binding var andarAtual: String
    //Aqui ta conectando o andarAtual do MapView a essa view
    
    var body: some View{
        VStack(alignment: .center){
            Color.gray
                .ignoresSafeArea()
                .opacity(0.2)
                .overlay(){
                    VStack(alignment: .center){
                        Text("BLOCO DE PESQUISA - BP").bold()
                        
                        Image("front_BP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        BotaoAndar(andar: "5 andar",
                                   descricao: "Apple Developer Academy",
                                   andarAtual: $andarAtual)
                        BotaoAndar(andar: "4 andar",
                                   descricao: "Apple Developer Academy",
                                   andarAtual: $andarAtual)
                        BotaoAndar(andar: "3 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   andarAtual: $andarAtual)
                        BotaoAndar(andar: "2 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   andarAtual: $andarAtual)
                        BotaoAndar(andar: "1 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   andarAtual: $andarAtual)
                        
                    }
                    .padding([.top], 10)
                }
        }
        
    }
}

#Preview{
    @Previewable @State var andarAtual: String = ""
    FrontViewBP(andarAtual: $andarAtual)
}
