//
//  Salas.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI

struct Salas: View{
    @State var isPresented: Bool = false
    @State private var selectedLab: Laboratorio?
    var body: some View{
        ZStack{
            // região clicavel da LMG
            zonaClicavel(x_offset: 40, y_offset: -50, width: 110, height: 150, sala:"1")
        }
    }
}
#Preview {
    Salas()
}
