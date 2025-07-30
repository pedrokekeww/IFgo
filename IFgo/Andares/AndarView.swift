//
//  AndarView.swift
//  IFgo
//
//  Created by found on 17/07/25.
//

import SwiftUI

struct AndarView: View{
    @Binding var andarAtual: String
    @Binding var ZonasClicaveis: [zonaClicavel]
    init(andarAtual: Binding<String>, ZonasClicaveis: Binding<[zonaClicavel]>){
        self._andarAtual = andarAtual
        self._ZonasClicaveis = ZonasClicaveis
    }
    var body: some View{
        ZStack{
            Image("\(andarAtual)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            ForEach(ZonasClicaveis){
            // seleciona o ultimo nó utilizado
                $0
            }
        }
    }
}
