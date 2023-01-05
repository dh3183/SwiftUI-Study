//
//  NetworkingRequestView.swift
//  Form
//
//  Created by 한빈 on 2023/01/03.
//

import SwiftUI

struct NetworkingRequestView: View {
    var body: some View {
        Form {
            Section(footer: Text("알고 있는 네트워크에 자동으로 연결됩니다. 사용 가능한 알고 있는 네트워크가 없다면, 사용할 수 있는 네트워크를 알려줍니다.")) {
                List {
                    HStack {
                        Text("끔")
                    }
                    HStack {
                        Text("알림")
                        Spacer()
                        Button(action: {}, label: { Image(systemName: "checkmark") })
                    }
                    Text("묻기")
                }
            }
        }
    }
}

struct NetworkingRequestView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkingRequestView()
    }
}
