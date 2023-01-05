//
//  HotspotView.swift
//  Form
//
//  Created by 한빈 on 2023/01/03.
//

import SwiftUI

struct HotspotView: View {
    var body: some View {
        List {
            Text("안 함")
            HStack {
                Text("연결 요청")
                Spacer()
                Button(action: {}, label: { Image(systemName: "checkmark") })
            }
            Text("자동")
        }
    }
}

struct HotspotView_Previews: PreviewProvider {
    static var previews: some View {
        HotspotView()
    }
}
