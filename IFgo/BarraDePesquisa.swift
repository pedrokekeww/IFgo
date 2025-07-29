import SwiftUI
import Foundation
import SwiftData

extension String {
    /// Remove acentos, ignora maiúsculas/minúsculas e espaços extras.
    var normalizedForSearch: String {
        self.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var searchText: String = ""
    @State var selectedLab: Laboratorio?
    @State private var showNotFoundAlert = false
    @Query var historicoLabs: [LabRef]
    @State var mostrarHistorico: Bool = false

    var body: some View {
        NavigationStack {
            // Envolve o MapView, que agora recebe binding e callback
            MapView(
                mostrarHistorico: $mostrarHistorico,
                searchText: $searchText,
                onSearch: searchAndPresent,
                selectedLab: $selectedLab
            )
            .onTapGesture {
                mostrarHistorico = false
            }
            .sheet(item: $selectedLab) { lab in
                LabSheet(lab: lab)
                    .presentationDetents([.medium, .large])
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
    }

    private func searchAndPresent(_ query: String) {
        let termo = query.normalizedForSearch
        mostrarHistorico = false
        selectedLab = nil
        showNotFoundAlert = false

        guard !termo.isEmpty else { return }

        if let match = Laboratorio.allLabs
            .first(where: { $0.nome.normalizedForSearch.contains(termo) }) {
            selectedLab = match

            if (!historicoLabs.contains(LabRef(labIndex: match.id))){
                modelContext.insert(LabRef(labIndex: match.id))
            }
        } else {
            showNotFoundAlert = true
        }
    }
}

#Preview{
    //@Previewable @State var mostrarHistorico = false
    ContentView()
        .modelContainer(for: [LabRef.self])
}
