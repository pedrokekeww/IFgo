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
    
    init(){
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            NavigationStack {

                ContentView()
                    .sheet(item: $selectedLab) { lab in
                        LabSheet(lab: lab)
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                            .padding()
                    }
            }
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
            .toolbarBackground(Color.black, for: .tabBar)
            .tabItem {
                Label(title: {
                    Text("Mapa")
                }, icon: {
                    Image(systemName: "safari.fill")
                        .renderingMode(.template)
                })
            }
            
            NavigationStack {
                LabsListView(groupedLabs: grouped, onSelect: { lab in
                    selectedLab = lab
                })
            }
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
            .toolbarBackground(Color.black, for: .tabBar)
            .tabItem {
                Label("Salas", systemImage: "list.bullet")

            }
        }

    }
    
    /// (Método removido: computeGroupedLabs encerrada no computed var grouped)
}

#Preview{
    MainTabView()
        .modelContainer(for: [LabRef.self])
}
