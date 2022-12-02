//
//  homeview.swift
//  t
//
//  Created by 한빈 on 2022/12/02.
//

import SwiftUI

struct Homeview: View {
    var body: some View {
        List {
            Text("애플워치 SE")
            Text("에어팟 프로 맥스")
            Text("맥북 프로")
        }
    }
}

struct homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
