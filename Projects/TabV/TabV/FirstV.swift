//
//  FirstV.swift
//  TabV
//
//  Created by 한빈 on 2022/11/19.
//

import SwiftUI

struct FirstV: View {
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("추가")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct FirstV_Previews: PreviewProvider {
    static var previews: some View {
        FirstV()
    }
}
