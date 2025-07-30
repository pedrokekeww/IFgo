import SwiftUI

/// View que exibe laboratórios agrupados por bloco e andar em estilo minimalista.
struct LabsListView: View {
    let groupedLabs: [String: [Int: [Laboratorio]]]
    let onSelect: (Laboratorio) -> Void  // callback para seleção
    private let blockFloors: [(block: String, floors: [Int])]

    init(groupedLabs: [String: [Int: [Laboratorio]]], onSelect: @escaping (Laboratorio) -> Void) {
        self.groupedLabs = groupedLabs
        self.onSelect = onSelect
        self.blockFloors = groupedLabs
            .map { (block: $0.key, floors: Array($0.value.keys).sorted()) }
            .sorted { $0.block < $1.block }
    }

    var body: some View {
        List {
            ForEach(blockFloors, id: \.block) { item in
                Section(header: Text(item.block).font(.headline)) {
                    ForEach(item.floors, id: \.self) { andar in
                        Section(header: Text("\(andar)º andar")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)) {
                            ForEach(groupedLabs[item.block]?[andar] ?? []) { lab in
                                Button(action: { onSelect(lab) }) {
                                    LabRow(lab: lab)
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Salas")
    }
}

private struct LabRow: View {
    let lab: Laboratorio
    var body: some View {
        HStack {
            Text(lab.nome)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "building.2.fill")
                .foregroundColor(.accentColor)
            Text("iOS")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
        .background(Color(.systemGray5))
        .cornerRadius(8)
    }
}
