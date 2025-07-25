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
    @State var salasClicaveis: [zonaClicavel] = []
    // var listaDeAndares: []
    // Fazer a struct andar e fazer isso ser modular
    // Na real é só fazer um botao que faz o andarAtual voltar a ser "

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
                    AndarView(andarAtual: $andarAtual, ZonasClicaveis: $salasClicaveis)
                    Button("Voltar"){
                        andarAtual = "";
                        // Isso faz com que pare de mostrar a imagem, ja que nao existe
                        // imagem com nome vazio
                    }
                    .offset(x: 10, y: -140)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    Button("            "){
                        mostrarFrontView = true
                    }
                    .frame(width:80, height: 80)
                    .border(.black, width:4)
                    .background(.blue)
                    .opacity(0.5)
                    .offset(x: 24, y: 110)
                }
            }
        }
        .sheet(isPresented: $mostrarFrontView){
            //Para as outras views terem acesso a variavel andar Atual, precisei passa-la
            //como binding para essas views.
            FrontViewBP(andarAtual: $andarAtual, ZonasClicaveis: $salasClicaveis)
                .presentationDetents([.height(540)])
        }
    }
}

#Preview {
    MapView()
}
