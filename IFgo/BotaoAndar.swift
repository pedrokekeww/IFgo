//
//  BotaoAndar.swift
//  IFgo
//
//  Created by found on 15/07/25.
//I
import SwiftUI



struct BotaoAndar: View{
    @Environment(\.dismiss) var fechar
    @State var andar: String
    @State var descricao: String
    @ObservedObject var Andar: AndarAtual
    
    init(andar: String, descricao:String){
        self.andar = andar
        self.descricao = descricao
        self.Andar = AndarAtual(andarAtual: andar)
    }
    
    var body: some View{
        Button(action: printar){
            Text("\(Text("\(andar) - ").bold())\(Text(descricao))")
                .foregroundColor(.black)
                .frame(width: 300, height: 20, alignment: .leading)
        }
        .buttonStyle(.borderedProminent)
        .tint(.white)
    }
    
    func printar(){
        Andar.andarAtual = andar
        fechar()
    }
}

#Preview{
    BotaoAndar(andar: "1 andar", descricao: "LMC, LMC, LMC, LMC...")
}
