import SwiftUI

struct BarraDePesquisaView: View {
    @Binding var searchText: String
    var onSearch: (String) -> Void
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $searchText)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.white)
                .onSubmit {
                    DispatchQueue.main.async { onSearch(searchText) }
                }
        }
        
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.black))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.white), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }

}
