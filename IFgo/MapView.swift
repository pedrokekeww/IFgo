//
//  ContentView.swift
//  IFgo
//
//  Created by found on 25/06/25.
//

import SwiftUI
import SwiftData

struct MapView: View {
    @State var mostrarFrontView: Bool = false
    //Substituir andarAtual depois pela instancia da verdadeira AndarView
    //Quando o botao for apertado
    @State var andarAtual: String = ""

    var body: some View {
        NavigationStack{
            Image("ex_top_BP")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(){
                    Button("            "){
                        mostrarFrontView = true
                    }
                    .frame(width:80, height: 80)
                    .border(.black, width:4)
                    .background(.blue)
                    .opacity(0.6)
                    .offset(x: 24, y: 100)
                    
                }
                .overlay(){
                    AndarView(nomeDoAndar: andarAtual)
                }
        }
        .sheet(isPresented: $mostrarFrontView){
            FrontViewBP()
                .presentationDetents([.height(540)])
        }
    }
}

#Preview {
    MapView(andarAtual: "")
}
