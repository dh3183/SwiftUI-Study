//
//  SecondV.swift
//  TabV
//
//  Created by 한빈 on 2022/11/19.
//

import SwiftUI

struct SecondV: View {
    var body: some View {
        ZStack{
            Color.orange
            VStack{
                Text("홈")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SecondV_Previews: PreviewProvider {
    static var previews: some View {
        SecondV()
    }
}
