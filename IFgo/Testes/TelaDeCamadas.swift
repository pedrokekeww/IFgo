//
//  sistemaDeCamadas.swift
//  IFgo
//
//  Created by found on 04/07/25.
//


public struct Andar: Identifiable, Hashable{
    public let id = UUID()
    
    init(nomeDaImagem: String){
        
        self.nomeDaimagem = nomeDaImagem
    }
    
    var nomeDaimagem: String
}
// Struct andar vai servir para as istancias de cada andar, contendo suas informações
struct example{
    let andar: Andar = Andar(nomeDaImagem: "1 andar")
}
// struct example é só um exemplo

import SwiftUI

//Aqui é a tela onde cayque vai estar testando o overlay
struct TelaDeCamadas: View{
    var andares: [Andar] = [Andar(nomeDaImagem: "2 andar"), Andar(nomeDaImagem: "1 andar")] // vetor com vários andares.
    @State var andarAtual: Andar = example().andar
    
    var body: some View {
          ZStack{
              
              Image("1 andar")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
              // Picker com título e variável de estado que mostra seleção atual
              Picker("primeiro andar", selection:$andarAtual){
                  // Para cada andar, mostra o nome dele no Picker com o elemento Text
                  // e usa a propriedade tag pra mudar o valor da variável de estado
                  ForEach(andares){
                      Text($0.nomeDaimagem)
                          .tag($0)
                      andar(ZonasClicaveis: [
                        zonaClicavel(x_offset: -100, y_offset: 0, width: 110, height: 100, sala: 2, nome: "PLACEHOLDER"),
                        zonaClicavel(x_offset: 100, y_offset: -56, width: 110, height: 180, sala: 1, nome: "PLACEHOLDER")])
                  }
              }
              .frame(width:40, height: 40)
              .offset(x: 0, y:-350)
              zonaClicavel(x_offset: 160, y_offset: -13, width: 85, height: 113, sala: 0, nome: "LMC")
          }
    }
}
    


#Preview{
    TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "1 andar"))
    
}
