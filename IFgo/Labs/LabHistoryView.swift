//
//  LabHistoryView.swift
//  IFgo
//
//  Created by found on 28/07/25.
//
import SwiftUI
import SwiftData

struct LabHistoryView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \LabRef.date, order: .reverse) var historicoLabs: [LabRef]
    @Binding var selectedLab: Laboratorio?
    
    var body: some View{
        List{
            ForEach(historicoLabs.prefix(3)) { labRef in
                HStack {
                    Button("\(Laboratorio.allLabs[labRef.labIndex].nome)") {
                        selectedLab = Laboratorio.allLabs[labRef.labIndex]
                    }
                    .padding(8)
                    .cornerRadius(8)
                    Spacer()
                    Button("x") {
                        modelContext.delete(labRef)
                    }
                    .padding(8)
                    .buttonStyle(.borderless)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
        }
        .listRowSpacing(-18)
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .id(historicoLabs.count)
    }
    
}

#Preview{
    @Previewable @State var selectedLab: Laboratorio? = Laboratorio.allLabs[0]
    LabHistoryView(selectedLab: $selectedLab)
        .modelContainer(for: [LabRef.self])
}
