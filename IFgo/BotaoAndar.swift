//
//  BotaoAndar.swift
//  IFgo
//
//  Created by found on 15/07/25.
//I
import SwiftUI



struct BotaoAndar: View{
    //Botao do Andar modularizado, só precisa passar os parametros necessários
    //que vai fazer um botao funcional
    @Environment(\.dismiss) var fechar
    @State var andar: String
    @State var descricao: String
    @Binding var andarAtual: String
    
    init(andar: String, descricao:String, andarAtual: Binding<String>){
        self.andar = andar
        self.descricao = descricao
        self._andarAtual = andarAtual
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
        andarAtual = andar
        fechar()
    }
}

#Preview{
    @Previewable @State var andarAtual: String = ""
    BotaoAndar(andar: "1 andar", descricao: "LMC, LMC, LMC, LMC...", andarAtual: $andarAtual)
}
