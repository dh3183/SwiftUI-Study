//
//  ModalView.swift
//  modalpra
//
//  Created by 한빈 on 2022/11/21.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width: 400, height: 400)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
