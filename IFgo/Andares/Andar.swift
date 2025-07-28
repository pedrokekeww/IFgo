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
