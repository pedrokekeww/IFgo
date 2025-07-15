//
//  BotaoAndar.swift
//  IFgo
//
//  Created by found on 15/07/25.
//I
import SwiftUI

struct BotaoAndar: View{
    @State var andar: String
    @State var descricao: String 
    
    init(andar: String, descricao:String){
        self.andar = andar
        self.descricao = descricao
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
        print("banana")
    }
}

#Preview{
    BotaoAndar(andar: "1 andar", descricao: "LMC, LMC, LMC, LMC...")
}
