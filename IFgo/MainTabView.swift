struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView() // mapa + barra de busca
                .tabItem {
                    Label("Mapa", systemImage: "safari.fill")
                }

            AprendizadoView()
                .tabItem {
                    Label("Aprender", systemImage: "graduationcap.fill")
                }

            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "bookmark.fill")
                }
        }
    }
}