import SwiftUI
import Foundation
extension String {
    /// Remove acentos, ignora maiúsculas/minúsculas e espaços extras.
    var normalizedForSearch: String {
        self.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
struct ContentView: View {
    @State private var searchText: String = ""
    @State private var selectedLab: Laboratorio?
    @State private var showNotFoundAlert = false

    var body: some View {
            MapView(
                searchText: $searchText,
                onSearch: searchAndPresent
            )
    
            .sheet(item: $selectedLab) { lab in
                LabSheet(lab: lab)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                    .presentationBackground(.black)
                    .padding()
            }
            .alert("Laboratório não encontrado",
                   isPresented: $showNotFoundAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Nenhum laboratório “\(searchText)” encontrado.")
            }
        }

    private func searchAndPresent(_ query: String) {
        let termo = query.normalizedForSearch
        selectedLab = nil
        showNotFoundAlert = false

        guard !termo.isEmpty else { return }

        if let match = Laboratorio.allLabs
            .first(where: { $0.nome.normalizedForSearch.contains(termo) }) {
            selectedLab = match
        } else {
            showNotFoundAlert = true
        }
    }
}

#Preview{
    ContentView()
}
