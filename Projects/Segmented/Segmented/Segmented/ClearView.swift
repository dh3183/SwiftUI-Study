//
//  ClearView.swift
//  t
//
//  Created by 한빈 on 2022/12/02.
//

import SwiftUI

struct ClearView: View {
    var body: some View {
        List {
            Text("빨래 건조대")
            Text("다이슨 청소기")
            Text("애플 TV")
        }
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        ClearView()
    }
}
