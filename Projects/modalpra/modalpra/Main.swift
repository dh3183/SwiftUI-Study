//
//  Main.swift
//  modalpra
//
//  Created by 한빈 on 2022/11/21.
//

import SwiftUI

struct Main: View {
    @State private var showModal = false
    
    var body: some View {
        VStack{
            Text("모달은 수달")
            Button(action: {
                self.showModal = true
            }){
                Text("깔깔깔 🤭").bold()
            }
            .frame(width: 100, height: 50, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
            .sheet(isPresented: self.$showModal) {
                ModalView()
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
