//
//  ContentView.swift
//  LazyGrid
//
//  Created by 한빈 on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(1...100, id: \.self) {
                    Text("텍스트 \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
