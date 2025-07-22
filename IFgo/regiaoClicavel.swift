//
//  regiaoClicavel.swift
//  IFgo
//
//  Created by found on 15/07/25.
//
//

import SwiftUI
public struct zonaClicavel:View{
    @State var x_offset: CGFloat
    @State var y_offset: CGFloat
    @State var width: CGFloat
    @State var height: CGFloat
    @State var sala: Int
    @State var goToAndar = false
    
    public var body: some View{
            
        // Começo da zona Clicavel
        ZStack(alignment: .center){
            Color(.blue)
                
            // Estilização da região
            .padding()
            .buttonStyle(.borderedProminent)
            .offset(x: x_offset, y: y_offset)
            .opacity(0.2)
            .frame(maxWidth: width, maxHeight: height)
            .onTapGesture {
                goToAndar = true
            }
            .sheet(isPresented: $goToAndar){
                LabSheet(lab: Laboratorio.allLabs[sala])
            }
        }
        // Fim da zona Clicavel
    }
}

#Preview {
    zonaClicavel(x_offset: 40, y_offset: -50, width: 110, height: 150, sala: 5)
}

// fazer uma função para cada andar com suas salas dentro da ZStack - ex: andar 1(){ zonaClicavel, zonaClicavel, para casa sala que tem no andar
