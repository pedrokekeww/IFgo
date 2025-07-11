//
//  detalhesLaboratorioView.swift
//  IFgo
//
//  Created by found on 11/07/25.
//
import SwiftUI
import Foundation

struct DetalhesLaboratorioView: View {
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
