//
//  frontViewBP.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI

struct FrontViewBP: View{
    var body: some View{
        VStack(alignment: .center){
            Image("front_BP")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment:.center){
                Text("Bloco inaugurado em 2015")
                Text("Conhecido por seus laboratórios")
            }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(.blue)
            
            
        }
    }
}

#Preview{
    FrontViewBP()
}
