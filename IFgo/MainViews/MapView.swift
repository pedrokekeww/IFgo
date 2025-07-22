//
//  ContentView.swift
//  IFgo
//
//  Created by found on 25/06/25.
//

import SwiftUI
import SwiftData

//Essa classe vai ser responsável por armazenar o andarAtual que vai ser mostrado
//No mapa
class AndarAtual: ObservableObject{
    init (andarAtual: String){
        self.andarAtual = andarAtual
    }
    @Published var andarAtual: String = ""
}

struct MapView: View {
    @State var mostrarFrontView: Bool = false
    //Substituir andarAtual depois pela instancia da verdadeira AndarView
    //Quando o botao for apertado
    // A variável andar atual representa a string que vai ser passada pra classe Image
    @State var andarAtual: String = ""
    // var listaDeAndares: []
    // Fazer a struct andar e fazer isso ser modular
    // Na real é só fazer um botao que faz o andarAtual voltar a ser "
    
    @State var offset = CGSize.zero
    var body: some View {
        // Navigation Stack para poder abrir a sheet
        NavigationStack{
            // ZStack que vai empilhar um andar em cima da top-view do bloco
            ZStack{
                Image("ex_top_BP")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture{
                        mostrarFrontView = true
                    }
                if (andarAtual != ""){
                    AndarView(andarAtual: $andarAtual)
                        .overlay{
                            // PLACEHOLDER DE REGIAO CLICAVEL
                            Button("            "){
                                mostrarFrontView = true
                            }
                            .frame(width:80, height: 80)
                            .border(.black, width:4)
                            .background(.blue)
                            .opacity(0.6)
                            .offset(x: 24, y: 100)
                        }
                    Button("Voltar"){
                        andarAtual = "";
                        // Isso faz com que pare de mostrar a imagem, ja que nao existe
                        // imagem com nome vazio
                    }
                    .offset(x: 10, y: -140)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .rotationEffect(.degrees(offset.width / 5.0))
            .offset(x: offset.width * 5)
            .gesture(
                DragGesture()
            )
        }
        .sheet(isPresented: $mostrarFrontView){
            //Para as outras views terem acesso a variavel andar Atual, precisei passa-la
            //como binding para essas views.
            FrontViewBP(andarAtual: $andarAtual)
                .presentationDetents([.height(540)])
        }
    }
}

#Preview {
    MapView()
}

//import SwiftUI
//
////Aqui é a tela onde cayque vai estar testando o overlay
//struct TelaDeCamadas: View{
//    var andares: [Andar] = [Andar(nomeDaImagem: "2"), Andar(nomeDaImagem: "1")] // vetor com vários andares.
//    @State var andarAtual: Andar = example().andar
//
//    var body: some View {
//          ZStack{
//              Image("planoDeFundo")
//              Image(andarAtual.nomeDaimagem)
//                  .resizable()
//                  .frame(width: 400, height: 400)
//                  .border(.black, width: 4)
//              // Picker com título e variável de estado que mostra seleção atual
//              Picker("Primeiro Andar", selection:$andarAtual){
//                  // Para cada andar, mostra o nome dele no Picker com o elemento Text
//                  // e usa a propriedade tag pra mudar o valor da variável de estado
//                  ForEach(andares){
//                      Text($0.nomeDaimagem)
//                          .tag($0)
//                  }
//              }
//              .frame(width:40, height: 40)
//              .offset(x: 0, y:-350)
//          }
//    }
//}
//
//
//
//#Preview{
//    TelaDeCamadas(andarAtual: Andar(nomeDaImagem: "2"))
//}
