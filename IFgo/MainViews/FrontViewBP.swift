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
    @Binding var ZonasClicaveis: [zonaClicavel]
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
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1)],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "4 andar",
                                   descricao: "Apple Developer Academy",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1)],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "3 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1)],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "2 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1)],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "1 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   salas:
                                    [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1),
                                   zonaClicavel(x_offset: 500, y_offset: -100, width: 100, height: 100, sala: 2),
                                   zonaClicavel(x_offset: 200, y_offset: -100, width: 100, height: 100, sala: 3),
                                   zonaClicavel(x_offset: -300, y_offset: -100, width: 100, height: 100, sala: 4),
                                     zonaClicavel(x_offset: -400, y_offset: -100, width: 100, height: 100, sala: 5)],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        
                    }
                    .padding([.top], 10)
                }
        }
        
    }
}

#Preview{
    @Previewable @State var andarAtual: String = ""
    @Previewable @State var ZonasClicaveis: [zonaClicavel] = []
    FrontViewBP(andarAtual: $andarAtual, ZonasClicaveis: $ZonasClicaveis)
}
