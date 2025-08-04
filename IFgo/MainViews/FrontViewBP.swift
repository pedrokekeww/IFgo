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
                        .overlay()
                {
                    VStack(alignment: .center){
                        Text("BLOCO DE PESQUISA - BP")
                        .bold()
                        .foregroundColor(Color(white: 0.8))
                        
                        Image("front_BP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        BotaoAndar(nome: "5 andar",
                                   andar: "4&5_andar",
                                   descricao: "Apple Developer Academy",
                                   salas: [zonaClicavel(x_offset: 13, y_offset: -11, width: 377, height: 200, sala: 14, nome: "APPLE DEVELOPER ACADEMY (SANDBOX)")],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(nome: "4 andar",
                                   andar: "4&5_andar",
                                   descricao: "Apple Developer Academy",
                                   salas: [zonaClicavel(x_offset: 13, y_offset: -11, width: 377, height: 200, sala: 13, nome: "APPLE DEVELOPER ACADEMY (CAMPFIRE)")],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(nome: "3 andar",
                                   andar: "2&3_andar",
                                   descricao: "LDS, LPDS, GDESTE...",
                                   salas:
                                    [
                                        zonaClicavel(x_offset: 147, y_offset: -35, width: 112, height: 153, sala: 12, nome: "FOTÔNICA"),
                                        zonaClicavel(x_offset: -19, y_offset: -35, width: 112, height: 153, sala: 11, nome: "LPDS"),
                                        zonaClicavel(x_offset: 63, y_offset: -35, width: 113, height: 152, sala: 10,
                                            nome: "GDESTE"),
                                        zonaClicavel(x_offset: -110, y_offset: -10, width: 130, height: 200, sala: 9, nome: "LDS")
                                    ],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(nome: "2 andar",
                                   andar: "2&3_andar",
                                   descricao: "LIA, LAPISCO, LAPADA...",
                                   salas:
                                    [
                                        zonaClicavel(x_offset: 147, y_offset: -35, width: 112, height: 153, sala: 8, nome: "LAPISCO"),
                                        zonaClicavel(x_offset: -110, y_offset: -10, width: 130, height: 200, sala: 7, nome: "LIA"),
                                        zonaClicavel(x_offset: -19, y_offset: -35, width: 112, height: 153, sala: 6, nome: "HASH"),
                                        zonaClicavel(x_offset: 63, y_offset: -35, width: 113, height: 152, sala: 5,
                                            nome: "LAPADA")
                                    ],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        BotaoAndar(nome: "1 andar",
                                   andar: "1_andar",
                                   descricao: "LMC, LMG, LERCA...",
                                   salas:
                                    [
                                        zonaClicavel(x_offset: 160, y_offset: -13, width: 85, height: 113, sala: 4, nome: "LMC"),
                                        zonaClicavel(x_offset: 147, y_offset: -76, width: 115, height: 75, sala: 3, nome: "LMG"),
                                        zonaClicavel(x_offset: -19, y_offset: -35, width: 112, height: 153, sala: 2, nome: "LIMAR"),
                                        zonaClicavel(x_offset: 65, y_offset: -37, width: 114, height: 154, sala: 1, nome: "LERCA"),
                                        zonaClicavel(x_offset: -110, y_offset: -10, width: 130, height: 200, sala: 0, nome: "LPQA")
                                    ],
                                   andarAtual: $andarAtual,
                                   ZonasClicaveis: $ZonasClicaveis)
                        
                    }
                    .padding([.top], 10)
                }
        }
        
    }
}
