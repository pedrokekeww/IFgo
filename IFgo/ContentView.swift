//
//  ContentView.swift
//  IFgo
//
//  Created by found on 25/06/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View
    {
        VStack
        {
            
        }
    }
}
#Preview
{
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
