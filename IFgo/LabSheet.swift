//
//  LabSheet.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import SwiftUI
import Foundation

struct LabSheet: View {
    let lab: Laboratorio

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Responsável: \(lab.responsavel)")
            Text("Horário: \(lab.horario)")
            Text("Descrição: \(lab.descricao)")
        }
        .padding()
        .navigationTitle(lab.nome)
    }
}

struct LabSheet_Previews: PreviewProvider{
    static var previews: some View {
        LabSheet(lab: Laboratorio.allLabs[0])
    }
}
