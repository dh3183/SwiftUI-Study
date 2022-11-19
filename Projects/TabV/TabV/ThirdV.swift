//
//  ThirdV.swift
//  TabV
//
//  Created by 한빈 on 2022/11/19.
//

import SwiftUI

struct ThirdV: View {
    var body: some View {
        ZStack{
            Color.red
            VStack{
                Text("검색")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ThirdV_Previews: PreviewProvider {
    static var previews: some View {
        ThirdV()
    }
}
