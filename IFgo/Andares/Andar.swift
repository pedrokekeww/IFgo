//  Andares.swift
//  IFgo
//
//  Created by found on 22/07/25.
//

import SwiftUI

public struct andar: View{
    @State var ZonasClicaveis: [zonaClicavel]
    public var body: some View {
        
        // parametros: zonas clicaveis que eu gostaria que tivesse neste andar
        // Se eu fizer o atributo que vai ser usado como argumento o numero do andar que estiver, daria certo
        ForEach(ZonasClicaveis){
            // seleciona o ultimo nó utilizado
                $0
        }
    }
}

#Preview{
    andar(ZonasClicaveis: [zonaClicavel(x_offset: 100, y_offset: -100, width: 150, height: 120, sala: 2, nome: "LMC"), zonaClicavel(x_offset: 100, y_offset: -100, width: 150, height: 120, sala: 3, nome: "LMC")])
}
