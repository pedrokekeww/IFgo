


import SwiftUI
import SwiftData

//Essa classe vai ser responsável por armazenar o andarAtual que vai ser mostrado
//No mapa
class AndarAtual: ObservableObject{
    init (andarAtual: String){
        self.andarAtual = andarAtual
    }
    @Published var andarAtual: String = "ex_top_BP"
}

struct MapView: View {
    @State var mostrarFrontView: Bool = false
    //Substituir andarAtual depois pela instancia da verdadeira AndarView
    //Quando o botao for apertado
    // A variável andar atual representa a string que vai ser passada pra classe Image
    @State var andarAtual: String = "ex_top_BP"
    @State var salasClicaveis: [zonaClicavel] = []
    // var listaDeAndares: []
    // Fazer a struct andar e fazer isso ser modular
    // Na real é só fazer um botao que faz o andarAtual voltar a ser "
    
    @Binding var searchText: String
    @State private var searchResult: String = ""
    let onSearch: (String) -> Void
    
    @State var offset = CGSize.zero
    @State var lastOffset = CGSize.zero
    @State var scale = 1.0
    @State var lastScale = 0.0
    var body: some View {
        // Navigation Stack para poder abrir a sheet
        NavigationStack{
            // ZStack que vai empilhar um andar em cima da top-view do bloco
            VStack {
                BarraDePesquisaView(
                    searchText: $searchText,
                    onSearch: { query in
                        // Atualiza texto de resultado, opcional
                        // Dispara callback principal para abrir LabSheet
                        onSearch(query)
                    },
                    placeholder: "Pesquisar"
                )
                // Exibe resultado de busca auxiliar, se desejar
                Text(searchResult)
                    .padding(.top, 4)
            }
            ZStack{
                Image("\(andarAtual)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture{
                        mostrarFrontView = true
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
                        mostrarFrontView = true
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
        .sheet(isPresented: $mostrarFrontView){
            //Para as outras views terem acesso a variavel andar Atual, precisei passa-la
            //como binding para essas views.
            FrontViewBP(andarAtual: $andarAtual, ZonasClicaveis: $salasClicaveis)
                .presentationDetents([.height(540)])
        }
    }
    
}
