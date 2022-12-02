//
//  ContentView.swift
//  t
//
//  Created by 한빈 on 2022/12/02.
//

import SwiftUI

struct MainView: View {
    @State var selected = 1
    
    var body: some View {
        VStack {
            Picker(selection: $selected, label: Text("Picker"), content: {
                Text("판매중").tag(1)
                Text("거래완료").tag(2)
                Text("숨김").tag(3)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            if selected == 1 {
                Homeview()
            } else if selected == 2 {
                ClearView()
            } else {
                HideView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
