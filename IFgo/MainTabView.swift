//
//  MainTabView.swift
//  IFgo
//
//  Created by found on 28/07/25.
//
import SwiftUI
import Foundation
import UIKit

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView() // mapa + barra de busca
                .tabItem {
                    Label("", systemImage: "safari.fill")
                }
            LabListView()
                .tabItem {
                    Label("", systemImage: "person.fill")
                }
        }.background(Color(.black))
    }
}
