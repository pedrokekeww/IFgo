//
//  pera_clicavel.swift
//  IFgo
//
//  Created by found on 11/07/25.
//

import SwiftUI
import SwiftOverlayShims

struct peraClicavel: View{
    var body: some View{
        ZStack{
            Image("pera")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            NavigationLink(destination: TelaDeCamadas()){
                Button(action:{}){
                    Text("                                                ")
                        .overlay(
                            Rectangle()
                                .inset(by: 0.3)
                        )
                }.buttonStyle(.bordered)
            }
                
        }
    }
}
#Preview {
    peraClicavel()
}
