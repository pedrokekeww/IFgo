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
    @Query var historicoLabs: [LabRef]
    
    var body: some View{
            List{
                ForEach(historicoLabs){ labRef in
                    HStack{
                        Button("\(Laboratorio.allLabs[labRef.labIndex].nome)"){
                            
                        }
                        Spacer()
                        
                        Button("X"){
                            modelContext.delete(labRef)
                        }
                        .buttonStyle(.borderless)
                    }

                }
            }
    }
    
}

#Preview{
    LabHistoryView()
        .modelContainer(for: [LabRef.self])
}
