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
    @State var salas: [zonaClicavel]
    @Binding var ZonasClicaveis: [zonaClicavel]
    @Binding var andarAtual: String
    
    init(andar: String, descricao:String, salas: [zonaClicavel], andarAtual: Binding<String>, ZonasClicaveis: Binding<[zonaClicavel]>){
        self.andar = andar
        self.descricao = descricao
        self.salas = salas
        self._andarAtual = andarAtual
        self._ZonasClicaveis = ZonasClicaveis
        
    }
    
    var body: some View{
        Button(action: atribuir_valores){
            Text("\(Text("\(andar) - ").bold())\(Text(descricao))")
                .foregroundColor(.black)
                .frame(width: 300, height: 20, alignment: .leading)
        }
        .buttonStyle(.borderedProminent)
        .tint(.white)
    }
    
    func atribuir_valores(){
        andarAtual = andar
        ZonasClicaveis = salas
        fechar()
    }
}

#Preview{
    @Previewable @State var andarAtual: String = ""
    @Previewable @State var ZonasClicaveis: [zonaClicavel] = []
    BotaoAndar(andar: "1 andar", descricao: "LMC, LMC, LMC, LMC...", salas: [zonaClicavel(x_offset: 100, y_offset: -100, width: 150, height: 150, sala: 3, nome: "LMC")], andarAtual: $andarAtual, ZonasClicaveis: $ZonasClicaveis)
}
