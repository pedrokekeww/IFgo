//
//  AndarView.swift
//  IFgo
//
//  Created by found on 17/07/25.
//

import SwiftUI

struct AndarView: View{
    @State var nomeDoAndar: String
    init(nomeDoAndar: String){
        self.nomeDoAndar = nomeDoAndar
    }
    var body: some View{
        Image("\(nomeDoAndar)")
    }
}

#Preview{
    AndarView(nomeDoAndar: "1 andar")
}
