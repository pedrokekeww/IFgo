import SwiftData
//<<<<<<< HEAD
import SwiftUI

struct MapView: View {
    @State var salasClicaveis: [zonaClicavel] = []
    @Binding var searchText: String
    let onSearch: (String) -> Void
    @State private var showFrontView = false
    @State private var andarAtual = "ex_top_BP"
    @State var tituloTabItem: String = "Navegação"
    @Binding var selectedLab: Laboratorio?
    @FocusState var mostrarHistorico: Bool
    @State var mostrarFrontView: Bool = false

    @State var offset = CGSize.zero
    @State var lastOffset = CGSize.zero
    @State var scale = 1.0
    @State var lastScale = 0.0
    
    // Sugestões dinâmicas — agora com até 3 itens
    private var suggestions: [Laboratorio] {
        let termo = searchText.normalizedForSearch
        guard !termo.isEmpty else { return [] }
        return Array(
            Laboratorio
                .allLabs
                .filter { $0.nome.normalizedForSearch.contains(termo) }
                .prefix(3)  // pega somente os 3 primeiros
        )
    }

    var body: some View {
        NavigationStack {
            Color.black
                .ignoresSafeArea()
                .overlay {
                    ZStack {
                        
                        if searchText.isEmpty && mostrarHistorico {
                            ZStack {
                                LabHistoryView(selectedLab: $selectedLab)
                                    .offset(y: 220)

                            }
                        }
                        if !suggestions.isEmpty {
                            VStack(spacing: 4) {
                                ForEach(suggestions) { lab in
                                    Button {
                                        searchText = lab.nome
                                        onSearch(lab.nome)
                                    } label: {
                                        Text(lab.nome)
                                            .padding(8)
                                            .frame(
                                                maxWidth: .infinity,
                                                alignment: .leading
                                            )
                                            .background(Color(.systemGray5))
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .transition(.opacity)
                            .animation(.default, value: suggestions)
                        }
                        BarraDePesquisaView(
                            searchText: $searchText,
                            mostrarHistorico: $mostrarHistorico,
                            onSearch: { query in
                                // Atualiza texto de resultado, opcional
                                // Dispara callback principal para abrir LabSheet
                                onSearch(query)
                            },
                            placeholder: "Pesquisar"
                        )
                    }
                    .offset(y: -200)
                    ZStack {
                        
                        Image("\(andarAtual)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .onTapGesture {
                                mostrarFrontView = true
                            }
                        if andarAtual != "ex_top_BP" {
                            AndarView(
                                andarAtual: $andarAtual,
                                ZonasClicaveis: $salasClicaveis
                            )
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    andarAtual = "ex_top_BP"
                                    tituloTabItem = "Navegação"
                                    // Isso faz com que pare de mostrar a imagem, ja que nao existe
                                    // imagem com nome vazio
                                }
                                .offset(x: -150, y: -125)
                                .buttonStyle(.borderedProminent)
                            Color(.blue)
                            .onTapGesture {
                                mostrarFrontView = true
                            }
                            .frame(width:80, height: 80)
                            .border(.black, width:4)
                            .background(.blue)
                            .opacity(0.2)
                            .offset(x: 24, y: 110)
                        }
                    }
                    // .rotationEffect(.degrees(offset.width / 10.0)) //Vai usar a variavel offset pra
                    // servir como valor de rotacao e de offset
                    .scaleEffect(scale)
                    .offset(x: offset.width, y: offset.height)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset.width =
                                    lastOffset.width + gesture.translation.width
                                offset.height =
                                    lastOffset.height
                                    + gesture.translation.height
                            }
                            .onEnded { _ in
                                lastOffset.width = offset.width
                                lastOffset.height = offset.height
                            }
                            .simultaneously(
                                with: MagnificationGesture(minimumScaleDelta: 0)
                                    .onChanged({ value in
                                        withAnimation(.bouncy) {
                                            if lastScale == 0 {
                                                scale = lastScale + value
                                            } else {
                                                scale = lastScale + value - 1
                                            }
                                        }
                                    })
                                    .onEnded { _ in
                                        lastScale = scale
                                    }
                            )

                    )
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(tituloTabItem)
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .toolbarColorScheme(.dark, for: .navigationBar)
            
        }

        
        .sheet(isPresented: $mostrarFrontView) {
            //Para as outras views terem acesso a variavel andar Atual, precisei passa-la
            //como binding para essas views.
            FrontViewBP(
                andarAtual: $andarAtual,
                ZonasClicaveis: $salasClicaveis,
                tituloTabItem: $tituloTabItem
            )
            .presentationDetents([.height(540)])
        }
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
