import SwiftUI
import SwiftData

struct MapView: View {
    @Binding var searchText: String
    let onSearch: (String) -> Void
    @State private var showFrontView = false
    @State private var andarAtual = ""

    // Sugestões dinâmicas
    private var suggestions: [Laboratorio] {
        let termo = searchText.normalizedForSearch
        return termo.isEmpty ? [] : Laboratorio.allLabs.filter { $0.nome.normalizedForSearch.contains(termo) }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BarraDePesquisaView(
                searchText: $searchText,
                onSearch: { query in
                    onSearch(query)
                },
                placeholder: "Pesquisar laboratórios"
            )

            if !suggestions.isEmpty {
                VStack(spacing: 4) {
                    ForEach(suggestions) { lab in
                        Button {
                            searchText = lab.nome
                            onSearch(lab.nome)
                        } label: {
                            Text(lab.nome)
                                .padding(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
                .transition(.opacity)
                .animation(.default, value: suggestions)
            }

            // Botão temporário para lista completa
            NavigationLink(
                destination: LabsListView(groupedLabs: computeGroupedLabs())
            ) {
                Text("Ver lista de laboratórios")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            ZStack {
                Image("ex_top_BP")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if !andarAtual.isEmpty {
                    AndarView(andarAtual: $andarAtual)
                    Button("Voltar") { andarAtual = "" }
                        .offset(x: 10, y: -140)
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                }
            }
            .overlay {
                Button("            ") { showFrontView = true }
                    .frame(width: 80, height: 80)
                    .border(.black, width: 4)
                    .background(.blue)
                    .opacity(0.6)
                    .offset(x: 24, y: 100)
            }
        }
        .sheet(isPresented: $showFrontView) {
            FrontViewBP(andarAtual: $andarAtual)
                .presentationDetents([.height(540)])
        }
    }

    // Agrupa laboratórios por bloco e andar
    private func computeGroupedLabs() -> [String: [Int: [Laboratorio]]] {
        var dict = [String: [Int: [Laboratorio]]]()
        for lab in Laboratorio.allLabs {
            dict[lab.bloco, default: [:]][lab.andar, default: []].append(lab)
        }
        return dict
    }
}

