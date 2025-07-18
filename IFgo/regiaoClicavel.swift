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
    @State var sala: String
    @State var goToAndar = false
    public var body: some View{
        // Navigation view a fim de preparar o navigation link
        NavigationStack{
            // Empilhamento da imagem do mapa com os botões que serão posicionados
            
                ZStack(alignment: .leading){
                    Color(.blue)
                }
            // Estilização do botão, manipulavel e modular
                .padding()
                .buttonStyle(.borderedProminent)
                .offset(x: x_offset, y: y_offset)
                .opacity(0.1)
                .frame(maxWidth: width, maxHeight: height)
                .onTapGesture {
                    goToAndar = true
                    print("oi")
                }
            .navigationDestination(isPresented: $goToAndar) {
                //LabSheet(lab: sala)
            }
        }
    }
}


#Preview {
  //  zonaClicavel(x_offset: 40, y_offset: -50, width: 110, height: 150, sala: )
}

