
import SwiftUI
public struct zonaClicavel: View, Identifiable{
    public var id: UUID = UUID()
    
    @State var x_offset: CGFloat
    @State var y_offset: CGFloat
    @State var width: CGFloat
    @State var height: CGFloat
    @State var sala: Int
    @State var goToAndar = false
    @State var nome: String

    
    public var body: some View{
        
        // Começo da zona Clicavel
        ZStack(alignment: .center){
            
            
            Color(.blue)
            
            // Estilização da região
                .padding()
                .buttonStyle(.borderedProminent)
                .offset(x: x_offset, y: y_offset)
                .opacity(0.01)
                .frame(maxWidth: width, maxHeight: height)
                .onTapGesture {
                    goToAndar = true
                    
                }
                .sheet(isPresented: $goToAndar){
                    LabSheet(lab: Laboratorio.allLabs[sala])
                        .presentationDetents([.medium, .large])
                }
            Text("\(nome)")
                .multilineTextAlignment(.center)
                .offset(x: x_offset, y: y_offset)
                .bold()
        }
    }
        // Fim da zona Clicavel
    }
