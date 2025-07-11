import SwiftUI

struct SheetView: View{
    @State var isPresented: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Button("Abrir Sheet"){
                    isPresented = true
                }
                // aparencia do botao
                .buttonStyle(.borderedProminent)
                .tint(.black)
                // .buttonBorderShape(<#T##shape: ButtonBorderShape##ButtonBorderShape#>)
            }
        }
        .sheet(isPresented: $isPresented){
            GooglePopUp()
                .presentationDetents([.medium])
        }
    }
}

#Preview{
    SheetView()
}
