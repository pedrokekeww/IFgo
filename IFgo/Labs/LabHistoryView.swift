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
                ForEach(historicoLabs.prefix(3)){ labRef in
                    HStack{
                        Button("\(Laboratorio.allLabs[labRef.labIndex].nome)"){
                            selectedLab = Laboratorio.allLabs[labRef.labIndex]
                            
                        }
                        Spacer()
                        
                        Button("X"){
                            modelContext.delete(labRef)
                        }
                        .buttonStyle(.borderless)
                    }

                }
            }
            .scrollContentBackground(.hidden)
            .id(historicoLabs.count)
    }
    
}

#Preview{
    @Previewable @State var selectedLab: Laboratorio? = Laboratorio.allLabs[0]
    LabHistoryView(selectedLab: $selectedLab)
        .modelContainer(for: [LabRef.self])
}
