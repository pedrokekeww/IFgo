//
//  frontViewBP.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI

struct FrontViewBP: View{
    // Pra deixar modular é só criar algumas variáveis
    
    var body: some View{
        VStack(alignment: .center){
            Color.gray
                .ignoresSafeArea()
                .opacity(0.2)
                .overlay(){
                    VStack(alignment: .center){
                        Text("BLOCO DE PESQUISA - BCC").bold()
                        
                        Image("front_BP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        BotaoAndar(andar: "5 andar", descricao: "Apple Developer Academy")
                        BotaoAndar(andar: "4 andar", descricao: "Apple Developer Academy")
                        BotaoAndar(andar: "3 andar", descricao: "LMC, LMC, LMC, LMC...")
                        BotaoAndar(andar: "2 andar", descricao: "LMC, LMC, LMC, LMC...")
                        BotaoAndar(andar: "1 andar", descricao: "LMC, LMC, LMC, LMC...")
                        
                    }
                    .padding([.top], 10)
                }
        }
        
    }
}

#Preview{
    FrontViewBP()
}
