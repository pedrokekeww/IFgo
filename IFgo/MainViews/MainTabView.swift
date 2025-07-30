import SwiftUI

/// View de abas principal, com navegação separada para cada tela
struct MainTabView: View {
    @State private var selectedLab: Laboratorio?  // para sheet de LabSheet
    
    // Computa dinamicamente os labs agrupados
    private var grouped: [String: [Int: [Laboratorio]]] {
        var dict = [String: [Int: [Laboratorio]]]()
        for lab in Laboratorio.allLabs {
            dict[lab.bloco, default: [:]][lab.andar, default: []].append(lab)
        }
        return dict
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                ContentView()
                    .sheet(item: $selectedLab) { lab in
                        LabSheet(lab: lab)
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                            .padding()
                    }
            }
            .tabItem {
                Label("Mapa", systemImage: "safari.fill")
            }
            
            NavigationStack {
                LabsListView(groupedLabs: grouped, onSelect: { lab in
                    selectedLab = lab
                })
            }
            .tabItem {
                Label("Salas", systemImage: "list.bullet")
            }
        }
        .background(Color(.systemBackground))
    }
    
    /// (Método removido: computeGroupedLabs encerrada no computed var grouped)
}
