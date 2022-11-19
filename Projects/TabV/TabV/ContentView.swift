//
//  ContentView.swift
//  TabV
//
//  Created by 한빈 on 2022/11/19.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FirstV()
                .tabItem{
                    Image(systemName: "house")
                    Text("홈")
                }
            SecondV()
                .tabItem{
                    Image(systemName: "plus")
                    Text("추가")
                }
            ThirdV()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
        }.tint(Color.teal)
            .onAppear(){
                UITabBar.appearance().barTintColor = .brown
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
