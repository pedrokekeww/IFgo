import SwiftUI

struct ContentView: View {
    private let listaDeLaboratorios = LaboratorioData.shared.laboratorios

    @State private var searchText: String = ""
    @State private var isPresented: Bool = false
    @State private var selectedLab: Laboratorio?

    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                // Campo de pesquisa
                TextField("Digite o nome do laboratório", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onSubmit {
                        procurarLaboratorio()
                    }

                Spacer()
            }
            .navigationTitle("Laboratórios")
            .sheet(isPresented: $isPresented)
            {
                // Se tiver selectedLab, apresenta a view com ele
                if let lab = selectedLab
                {
                    DetalhesLaboratorioView(lab: lab)
                } else
                {
                    // Fallback, nunca deve acontecer
                    Text("Laboratório não encontrado")
                        .padding()
                }
            }
        }
    }

    /// Normaliza e procura um laboratório com nome que case exatamente com o texto digitado.
    private func procurarLaboratorio()
    {
        let termo = searchText
            .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .trimmingCharacters(in: .whitespacesAndNewlines)

        if let encontrado = listaDeLaboratorios.first(where: { lab in
            lab.nome
                .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                == termo
        })
        {
            // Dispara a sheet
            selectedLab = encontrado
            isPresented = true
        }
        else
        {
            // Se nao achou: zera a sheet
            isPresented = false
        }
    }
}
#Preview
{
    ContentView()
}
