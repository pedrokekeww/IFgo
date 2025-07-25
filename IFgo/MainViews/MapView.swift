import SwiftUI
import SwiftData

//Essa classe vai ser responsável por armazenar o andarAtual que vai ser mostrado
//No mapa
class AndarAtual: ObservableObject {
    init(andarAtual: String) {
        self.andarAtual = andarAtual
    }
    @Published var andarAtual: String = ""
}

struct MapView: View {
    // Variaveis pra barra de pesquisa funcionar
    @Binding var searchText: String
    let onSearch: (String) -> Void
    @State private var searchResult: String = ""
    
    @State var mostrarFrontView: Bool = false
    //Substituir andarAtual depois pela instancia da verdadeira AndarView
    //Quando o botao for apertado
    // A variável andar atual representa a string que vai ser passada pra classe Image
    @State var andarAtual: String = ""
    // var listaDeAndares: []
    // Fazer a struct andar e fazer isso ser modular
    // Na real é só fazer um botao que faz o andarAtual voltar a ser ""

    var body: some View {
        // NavigationStack para poder abrir a sheet de FrontViewBP
        NavigationStack {
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
            // ZStack que vai empilhar um andar em cima da top-view do bloco
            ZStack {
                Image("ex_top_BP")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if !andarAtual.isEmpty {
                    AndarView(andarAtual: $andarAtual)
                    Button("Voltar") {
                        andarAtual = ""
                        // Isso faz com que pare de mostrar a imagem, ja que nao existe
                        // imagem com nome vazio
                    }
                    .offset(x: 10, y: -140)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .overlay {
                // PLACEHOLDER DE REGIAO CLICAVEL
                Button("            ") {
                    mostrarFrontView = true
                }
                .frame(width: 80, height: 80)
                .border(.black, width: 4)
                .background(.blue)
                .opacity(0.6)
                .offset(x: 24, y: 100)
            }
        }
        .sheet(isPresented: $mostrarFrontView) {
            //Para as outras views terem acesso a variavel andar Atual, precisei passa-la
            //como binding para essas views.
            FrontViewBP(andarAtual: $andarAtual)
                .presentationDetents([.height(540)])
        }
    }
}
