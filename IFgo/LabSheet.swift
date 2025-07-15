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

#Preview{
    LabSheet(lab: Laboratorio(
        nome: "Lmc10",
        andar: 2,
        bloco: "Bloco de Pesquisa",
        responsavel: "Cayque",
        horario: "20:20",
        descricao: "É um bloco de comedores de agua"
    ))
}
