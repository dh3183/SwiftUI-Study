//
//  SecondV.swift
//  TabV
//
//  Created by νλΉ on 2022/11/19.
//

import SwiftUI

struct SecondV: View {
    var body: some View {
        ZStack{
            Color.orange
            VStack{
                Text("ν")
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
