import SwiftUI
import Foundation

struct ContentView: View
{
    private var listaDeLaboratorios = LaboratorioData.shared.laboratorios
    @State var searchText: String = ""
    
    var body: some View
    {
        NavigationStack{
            List{
                ForEach(laboratoriosFiltrados){
                    laboratorio in
                    HStack{
                        Text(laboratorio.nome)
                        Spacer()
                    }
                    .padding()
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle(Text("Laboratórios"))
            .onChange(of: searchText) { oldValue, newValue in
                print("Search text changed to: \(newValue)")
                print("Filtered labs count: \(laboratoriosFiltrados.count)")
            }
        }
    }
    var laboratoriosFiltrados: [Laboratorio] {
        guard !searchText.isEmpty else {
            return listaDeLaboratorios
        }

        let cleanedSearchText = searchText
            .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return listaDeLaboratorios.filter { lab in
            let cleanedLabName = lab.nome
                .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            
            return cleanedLabName.contains(cleanedSearchText)
        }
    }
}
#Preview {
    ContentView()
}


