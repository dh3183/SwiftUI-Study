//
//  MainView.swift
//  ViewBuilder
//
//  Created by 한빈 on 2023/01/28.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ElbinVStack(color: .cyan) {
            Text("iOS")
            Text("Swift")
            Text("UIKit")
            Text("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
