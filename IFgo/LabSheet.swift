import SwiftUI
import Foundation

struct LabSheet: View
{
    let lab: Laboratorio
    @Environment(\.dismiss) var dismiss

    var body: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            // Conteúdo principal da sheet
            VStack(alignment: .leading, spacing: 15)
            {
                Text(lab.nome)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                Divider()

                Group
                {
                    HStack
                    {
                        Text("Bloco:")
                            .fontWeight(.semibold)
                        Text("\(lab.bloco)")
                    }
                    HStack
                    {
                        Text("Andar:")
                            .fontWeight(.semibold)
                        Text("\(lab.andar)")
                    }
                    HStack
                    {
                        Text("Responsável:")
                            .fontWeight(.semibold)
                        Text(lab.responsavel)
                    }
                    HStack
                    {
                        Text("Horário:")
                            .fontWeight(.semibold)
                        Text(lab.horario)
                    }
                }
                .font(.body)

                Divider()

                VStack(alignment: .leading, spacing: 5)
                {
                    Text("Descrição do Laboratório:")
                        .fontWeight(.semibold)
                    Text(lab.descricao)
                        .font(.body)
                }
            }
            .padding()

            Spacer()
        }
        .background(Color.white) // Fundo da sheet
        .cornerRadius(16) // Cantos arredondados da sheet
    }
}

#Preview{
    LabSheet(lab: Laboratorio(
        nome: "LMC4",
        andar: 2,
        bloco: "Bloco de Pesquisa",
        responsavel: "Cayque",
        horario: "8h às 12h",
        descricao: "É um bloco de comedores de agua"
    ))
}
