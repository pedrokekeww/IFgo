import SwiftUI
import Foundation

struct LabSheet: View
{
    let lab: Laboratorio
    @Environment(\.dismiss) var dismiss

    var body: some View
    {
        VStack()
        {
            // Conteúdo principal da sheet
            VStack(alignment: .leading, spacing: 15)
            {
                Text(lab.nome)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .colorInvert()

                Divider()

                Group
                {
                    HStack
                    {
                        Text("\(lab.descricao)").fontWeight(.bold).font(.title3).foregroundColor(.gray)
                    }
                    
                    HStack
                    {
                        Image(systemName: "building.2").foregroundColor(.green).font(.system(size: 24))
                        Text("Bloco:").colorInvert()
                            .fontWeight(.semibold)
                        Text("\(lab.bloco)").foregroundColor(Color(white: 0.78))
                        
                    }
                    HStack(spacing: 12)
                    {
                        Image(systemName: "figure.walk").foregroundColor(.green).font(.system(size: 24))
                        Text("Andar:").colorInvert()
                            .fontWeight(.semibold)
                        Text("\(lab.andar)").foregroundColor(Color(white: 0.78))
                    }
                    HStack(spacing: 12)
                    {
                        Image(systemName: "person.badge.key") .foregroundColor(.green).font(.system(size: 24))
                        Text("Responsável:").colorInvert()
                            .fontWeight(.semibold)
                        Text(lab.responsavel).foregroundColor(Color(white: 0.78))
                    }
                    HStack(spacing: 12)
                    {
                        Image(systemName: "clock").foregroundColor(.green).font(.system(size: 24))
                        Text("Horário:").colorInvert()
                            .fontWeight(.semibold)
                        Text("Aberto").foregroundColor(.green).fontWeight(.bold)
                    }
                    HStack()
                    {
                        Spacer().frame(width: 39)
                        Text(lab.horario).foregroundColor(Color(white:0.78))
                    }
                }
                .font(.body)
            }
            .padding()

            Spacer()
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .ignoresSafeArea() // Fundo da sheet
        .background(Color.black)
    }
}

#Preview{
    LabSheet(lab: Laboratorio(
        id: 30,
        nome: "LMC 4",
        andar: 2,
        bloco: "Bloco de Pesquisa",
        responsavel: "Cayque",
        horario: "8h às 12h",
        descricao: "É um bloco de comedores de agua"
    ))
}
