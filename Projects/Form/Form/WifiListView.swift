//
//  WifiListView.swift
//  Form
//
//  Created by 한빈 on 2023/01/03.
//

import SwiftUI

struct WifiListView: View {
    @State var wifiisOn = false
    @State private var notiStatus: noticase = .끔
    @State private var hotspotStatus: hotspotcase = .안함
    
    enum noticase: String, CaseIterable, Identifiable {
        case 끔, 알림, 묻기
        var id: Self { self }
    }
    
    enum hotspotcase: String, CaseIterable, Identifiable {
        case 안함, 연결요청, 자동
        var id: Self { self }
    }
    
    var body: some View {
        Form {
            Section {
                Toggle("Wi-Fi", isOn: $wifiisOn)
            }
            .padding(.leading)
            Section("네트워크") {
                List {
                    HStack {
                        Text("elbin의 iPhone")
                        Spacer()
                        Image(systemName: "lock.fill")
                        Image(systemName: "personalhotspot")
                        Button(action: {}) {
                            Image(systemName: "info.circle")
                        }
                    }
                    HStack{
                        Text("SK_WiFiGIGA1234_2.4G")
                        Spacer()
                        Image(systemName: "lock.fill")
                        Image(systemName: "wifi")
                        Button(action: {}) {
                            Image(systemName: "info.circle")
                        }
                    }
                    HStack{
                        Text("KT_GIGA_5G_Wave2_AB12")
                        Spacer()
                        Image(systemName: "lock.fill")
                        Image(systemName: "wifi")
                        Button(action: {}) {
                            Image(systemName: "info.circle")
                        }
                    }
                    HStack{
                        Text("iptime")
                        Spacer()
                        Image(systemName: "lock.fill")
                        Image(systemName: "wifi")
                        Button(action: {}) {
                            Image(systemName: "info.circle")
                        }
                    }
                    Text("기타...")
                }
                .padding(.leading)
            }
            Section(footer: Text("알고 있는 네트워크에 자동으로 연결됩니다. 사용 가능한 알고 있는 네트워크가 없다면, 사용할 수 있는 네트워크를 알려줍니다.")) {
                Picker("네트워크 연결 요청", selection: $notiStatus) {
                    Text("끔").tag(noticase.끔)
                    Text("알림").tag(noticase.알림)
                    Text("묻기").tag(noticase.묻기)
                }
                .pickerStyle(.navigationLink)
            }
            Section(footer: Text("사용 가능한 Wi-Fi 네트워크가 없을 때 이 기기가 자동으로 근처 개인용 핫스팟을 찾도록 허용합니다.")) {
                Picker("핫스팟 자동 연결", selection: $hotspotStatus) {
                    Text("안 함").tag(hotspotcase.안함)
                    Text("연결 요청").tag(hotspotcase.연결요청)
                    Text("자동").tag(hotspotcase.자동)
                }
                .pickerStyle(.navigationLink)
            }
        }
    }
}

struct WifiListView_Previews: PreviewProvider {
    static var previews: some View {
        WifiListView()
    }
}
