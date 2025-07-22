//
//  laboratorios.swift
//  IFgo
//
//  Created by found on 15/07/25.
//

import Foundation

struct Laboratorio: Codable, Identifiable{
    public var id: String { nome }
    let nome: String
    let andar: Int
    let bloco: String
    let responsavel, horario, descricao: String
    
    static let allLabs: [Laboratorio] = Bundle.main.decode(file: "laboratorios.JSON")
}



typealias Welcome = [Laboratorio]

extension Bundle{
    func decode<T: Decodable> (file:String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("file not found")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("file not loaded")
        }
        
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else{
            fatalError("file not Decoded")
        }
        return loadedData
    }
}
