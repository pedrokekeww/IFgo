//
//  Salas.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI

struct Salas: View{
    var body: some View{
        ZStack{
            // região clicavel da LMG
            zonaClicavel(x_offset: 40, y_offset: -50, width: 110, height: 150, sala: 2)
        }
    }
}
#Preview {
    Salas()
}
