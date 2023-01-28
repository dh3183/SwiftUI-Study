//
//  ContentView.swift
//  ViewBuilder
//
//  Created by 한빈 on 2023/01/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        manyTexts
    }
    
    @ViewBuilder
    var manyTexts: some View {
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
    }
}
