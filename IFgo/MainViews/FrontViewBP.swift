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
            Color.black
                .ignoresSafeArea()
                .opacity(0.90)
                .overlay(){
                    VStack(alignment: .center){
                        Text("BLOCO DE PESQUISA - BP").bold()
                            .foregroundColor(Color(white: 0.8))
                        Image("front_BP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        BotaoAndar(andar: "5 andar",
                                   descricao: "Apple Developer Academy",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1, nome: "Sala 1")],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "4 andar",
                                   descricao: "Apple Developer Academy",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1, nome: "nome")],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "3 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1, nome: "NOME")],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "2 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 100, height: 100, sala: 1, nome: "NOME")],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(andar: "1 andar",
                                   descricao: "LMC, LMC, LMC, LMC...",
                                   salas:
                                    [
                                        zonaClicavel(x_offset: -110, y_offset: -10, width: 130, height: 200, sala: 0, nome: "LPQA"),
                                        zonaClicavel(x_offset: 65, y_offset: -37, width: 114, height: 154, sala: 1, nome: "LERCA"),
                                        zonaClicavel(x_offset: 147, y_offset: -76, width: 115, height: 75, sala: 2, nome: "LMG"),
                                     
                                        zonaClicavel(x_offset: 160, y_offset: -13, width: 85, height: 113, sala: 3, nome: "LMC"),
                                        zonaClicavel(x_offset: -19, y_offset: -35, width: 112, height: 153, sala: 4, nome: "LIMAR"),
                                    ],
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
