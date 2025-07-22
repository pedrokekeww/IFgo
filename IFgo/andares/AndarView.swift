//
//  AndarView.swift
//  IFgo
//
//  Created by found on 17/07/25.
//

import SwiftUI

struct AndarView: View{
    @Binding var andarAtual: String
    init(andarAtual: Binding<String>){
        self._andarAtual = andarAtual
    }
    var body: some View{
            
            Image("\(andarAtual)")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
}

#Preview{
    @Previewable @State var andarAtual = "1 andar"
    AndarView(andarAtual: $andarAtual)
}

