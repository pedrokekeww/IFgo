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
// Struct andar vai servir para as istancias de cada andar, contendo suas informações
struct example{
    let andar: Andar = Andar(nomeDaImagem: "1")
}
// struct example é só um exemplo

import SwiftUI

//Aqui é a tela onde cayque vai estar testando o overlay
struct TelaDeCamadas: View{
    var andares: [Andar] = [Andar(nomeDaImagem: "2"), Andar(nomeDaImagem: "1")] // vetor com vários andares.
    @State var andarAtual: Andar = example().andar
    
    var body: some View {
          ZStack{
              Image("planoDeFundo")
              Image(andarAtual.nomeDaimagem)
                  .resizable()
                  .frame(width: 400, height: 400)
                  .border(.black, width: 4)
              // Picker com título e variável de estado que mostra seleção atual
              Picker("Primeiro Andar", selection:$andarAtual){
                  // Para cada andar, mostra o nome dele no Picker com o elemento Text
                  // e usa a propriedade tag pra mudar o valor da variável de estado
                  ForEach(andares){
                      Text($0.nomeDaimagem)
                          .tag($0)
                  }
              }
              .frame(width:40, height: 40)
              .offset(x: 0, y:-350)
          }
    }
}
    


#Preview{
    TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "2"))
}
