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
            ZStack{
                Color(.green)
                Text("LMC")
            }.onTapGesture {
                    print("hello, world")
                }
            .padding()
            .buttonStyle(.borderedProminent)
            .offset(x: 40, y: -50)
            .opacity(0.1)
            .frame(maxWidth: 110, maxHeight: 150)
            // região clicavel da LAPISCO
            ZStack{
                Color(.blue)
            }
            .onTapGesture {
                    print("hello, cayque")
                }
            .padding()
            .buttonStyle(.borderedProminent)
            .offset(x: 40, y: 80)
            .opacity(0.1)
            .frame(maxWidth: 110, maxHeight: 150)
        }
        
    
    }
    
    
}

#Preview {
    Salas()
}
