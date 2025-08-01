import SwiftUI

struct LabsListView: View {
    let groupedLabs: [String: [Int: [Laboratorio]]]
    let onSelect: (Laboratorio) -> Void
    private let blockFloors: [(block: String, floors: [Int])]

    init(
        groupedLabs: [String: [Int: [Laboratorio]]],
        onSelect: @escaping (Laboratorio) -> Void
    ) {
        self.groupedLabs = groupedLabs
        self.onSelect = onSelect
        self.blockFloors = groupedLabs
            .map { (block: $0.key, floors: Array($0.value.keys).sorted()) }
            .sorted { $0.block < $1.block }
    }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 4) {      // <--- espaçamento entre células reduzido
                ForEach(blockFloors, id: \.block) { section in
                    Text(section.block)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.black)

                    ForEach(section.floors, id: \.self) { floor in
                        Text("\(floor)º andar")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 24)
                            .background(Color.black)

                        ForEach(groupedLabs[section.block]?[floor] ?? []) { lab in
                            Button(action: { onSelect(lab) }) {
                                LabRow(lab: lab)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical, 2)   // <--- altura de cada item ligeiramente menor
                            }
                        }
                    }

                    Color.clear
                        .frame(height: 8)   // <--- espaço entre blocos reduzido
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Lista de Salas")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .background(Color.black)
        .toolbarBackground(Color.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

private struct LabRow: View {
    let lab: Laboratorio
    var body: some View {
        HStack {
            Text(lab.nome)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "building.2.fill")
                .foregroundColor(.white)
            Text("iOS")
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding(.vertical, 6)    // <--- padding vertical ligeiramente menor
        .padding(.horizontal, 12) // <--- padding horizontal ajustado
        .background(Color(.systemGray6).opacity(0.2))
        .cornerRadius(8)
    }
}

