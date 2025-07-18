//
//  LabSheet.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI
import Foundation

struct LabSheet: View {
    public var labs: [Laboratorio] = Laboratorio.allLabs
    let lab: Laboratorio
    
    var body: some View {
        
        NavigationStack{
            ForEach(labs, id: \.nome) { lab in
                Text("\(lab.nome)")
            }
        }
    }
}

struct LabSheet_Previews: PreviewProvider{
    static var previews: some View {
        LabSheet(lab: Laboratorio.sampleLab)
    }
}
