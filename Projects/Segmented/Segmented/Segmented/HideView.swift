//
//  mapview.swift
//  t
//
//  Created by 한빈 on 2022/12/02.
//

import SwiftUI

struct HideView: View {
    var body: some View {
        ZStack {
            Color(red: 242 / 255, green: 243 / 255, blue: 246 / 255).ignoresSafeArea()
            VStack {
                Text("숨기기한 게시글이 없어요.")
                    .foregroundColor(Color(red: 135 / 255, green: 139 / 255, blue: 147 / 255))
            }
        }
    }
}

struct mapview_Previews: PreviewProvider {
    static var previews: some View {
        HideView()
    }
}
