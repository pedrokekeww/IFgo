import SwiftUI

struct BarraDePesquisaView: View {
    @Binding var mostrarHistorico: Bool
    @Binding var searchText: String
    var onSearch: (String) -> Void
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField(placeholder, text: $searchText)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.primary)
                .onSubmit {
                    DispatchQueue.main.async { onSearch(searchText) }
                }
                .onChange(of: searchText){
                    mostrarHistorico = false
                    
                }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.secondarySystemFill), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}
