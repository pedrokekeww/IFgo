//<<<<<<< HEAD
import SwiftUI
import SwiftData

class AndarAtual: ObservableObject{
    init (andarAtual: String){
        self.andarAtual = andarAtual
    }
    @Published var andarAtual: String = "ex_top_BP"
}

struct MapView: View {
    @State var salasClicaveis: [zonaClicavel] = []
    @Binding var searchText: String
    let onSearch: (String) -> Void
    @State private var showFrontView = false
    @State private var andarAtual = "ex_top_BP"
    
    @State var offset = CGSize.zero
    @State var lastOffset = CGSize.zero
    @State var scale = 1.0
    @State var lastScale = 0.0

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

            ZStack{
                Image("\(andarAtual)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture{
                        showFrontView = true
                    }
                if (andarAtual != "ex_top_BP"){
                    AndarView(andarAtual: $andarAtual, ZonasClicaveis: $salasClicaveis)
                    Button("Voltar"){
                        andarAtual = "ex_top_BP";
                        // Isso faz com que pare de mostrar a imagem, ja que nao existe
                        // imagem com nome vazio
                    }
                    .offset(x: 10, y: -140)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    Button("            "){
                        showFrontView = true
                    }
                    .frame(width:80, height: 80)
                    .border(.black, width:4)
                    .background(.blue)
                    .opacity(0.5)
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
                        offset.width = lastOffset.width + gesture.translation.width
                        offset.height = lastOffset.height + gesture.translation.height
                    }
                    .onEnded { _ in
                        lastOffset.width = offset.width
                        lastOffset.height = offset.height
                    }
                    .simultaneously(
                        with: MagnificationGesture(minimumScaleDelta: 0)
                            .onChanged ({ value in
                                withAnimation(.bouncy) {
                                    if (lastScale == 0){
                                        scale = lastScale + value
                                    }
                                    else{
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
        
        .sheet(isPresented: $showFrontView) {
            FrontViewBP(andarAtual: $andarAtual, ZonasClicaveis: $salasClicaveis)
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
