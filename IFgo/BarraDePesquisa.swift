import SwiftUI

// MARK: - Extensão para Normalizar String

extension String {
    /// Remove acentos, ignora maiúsculas/minúsculas e espaços extras.
    var normalizedForSearch: String {
        folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// MARK: - ContentView

struct ContentView: View {
    // Estados
    @State private var searchText: String = ""
    @State private var selectedLab: Laboratorio?      // Quando não-nil, abre a sheet
    @State private var showNotFoundAlert = false      // Controla o alerta

    var body: some View {
        NavigationStack {
            VStack {
                // TextField sem sugestões, só dispara onSubmit
                TextField("Digite o nome do laboratório", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .submitLabel(.search)
                    .onSubmit {
                        // Garante que `searchText` já foi efetivamente atualizado
                        DispatchQueue.main.async {
                            searchAndPresent()
                        }
                    }

                Spacer()
            }
            .navigationTitle("Laboratórios")
            // Folha de detalhe: abre só se `selectedLab` != nil
            .sheet(item: $selectedLab) { lab in
                LabSheet(lab: lab)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
                    .padding()
                    .presentationBackground(Color.black)
            }
            // Alerta quando não encontrou
            .alert("Laboratório não encontrado",
                   isPresented: $showNotFoundAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Nenhum laboratório encontrado com o nome “\(searchText)”.")
            }
        }
    }

    // MARK: - Busca e apresentação

    private func searchAndPresent() {
        let termo = searchText.normalizedForSearch
        guard !termo.isEmpty else {
            // Se vazio, não faz nada
            selectedLab = nil
            showNotFoundAlert = false
            return
        }

        // Procura o primeiro match
        if let match = Laboratorio.allLabs
            .first(where: { $0.nome.normalizedForSearch.contains(termo) })
        {
            // Encontrou → atribui e abre sheet
            selectedLab = match
            showNotFoundAlert = false
        } else {
            // Não encontrou → mostra alerta
            selectedLab = nil
            showNotFoundAlert = true
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
