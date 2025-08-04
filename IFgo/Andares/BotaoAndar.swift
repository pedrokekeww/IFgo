
import SwiftUI

struct BotaoAndar: View{
    //Botao do Andar modularizado, só precisa passar os parametros necessários
    //que vai fazer um botao funcional
    @Environment(\.dismiss) var fechar
    @State var nome: String
    @State var andar: String
    @State var descricao: String
    @State var salas: [zonaClicavel]
    @Binding var ZonasClicaveis: [zonaClicavel]
    @Binding var andarAtual: String
    @Binding var tituloTabItem: String
    
    init(nome: String, andar: String, descricao:String, salas: [zonaClicavel], andarAtual: Binding<String>, ZonasClicaveis: Binding<[zonaClicavel]>, tituloTabItem: Binding<String>){
        self.nome = nome
        self.andar = andar
        self.descricao = descricao
        self.salas = salas
        self._andarAtual = andarAtual
        self._ZonasClicaveis = ZonasClicaveis
        self._tituloTabItem = tituloTabItem
        
    }
    
    var body: some View{
//        Button(action: atribuir_valores){
//            Text("\(Text("\(nome) - ").bold())\(Text(descricao))")
//                .foregroundColor(.black)
//                .frame(width: 300, height: 20, alignment: .leading)
//        }
        Button(action: atribuir_valores){
                    Text("\(Text("\(nome) - ").bold())\(Text(descricao))")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 20, alignment: .leading)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(white:0.20))
 
    }
    
    func atribuir_valores(){
        andarAtual = andar
        ZonasClicaveis = salas
        tituloTabItem = nome
        fechar()
    }
}
